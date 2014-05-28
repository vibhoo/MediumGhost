class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Gem friendly_id
  extend FriendlyId
  friendly_id :username, use: :slugged


  has_many :posts, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true,
            uniqueness: true,
            format: {
                with: /\A[a-zA-Z0-9_-]+\Z/,
                message: "Username cannot have spaces"
            }

  validates_length_of :username, minimum: 3, too_short: "Username must have atleast 2 characters"


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
