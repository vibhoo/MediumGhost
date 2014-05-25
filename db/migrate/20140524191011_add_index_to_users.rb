class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :slug, unique:true
    add_index :posts, :user_id
  end
end
