class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :bio
      t.string :avatar
      t.string :slug

      t.timestamps
    end
  end
end
