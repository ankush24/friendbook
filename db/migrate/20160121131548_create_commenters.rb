class CreateCommenters < ActiveRecord::Migration
  def change
    create_table :commenters do |t|
      t.text :comments
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps null: false
    end
  end
end
