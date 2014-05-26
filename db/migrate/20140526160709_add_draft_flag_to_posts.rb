class AddDraftFlagToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :drafts, :boolean
  end
end
