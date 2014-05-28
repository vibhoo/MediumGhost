class Post < ActiveRecord::Base

  validates :title, presence: true
  acts_as_taggable

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  has_attached_file :avatar, :styles => {:original=> "" , :medium => "400x400>", :thumb => "150x150>" }, :default_url => "/assets/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
