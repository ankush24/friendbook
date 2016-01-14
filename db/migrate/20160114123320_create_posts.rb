class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :Content

      t.timestamps null: false
    end
  end
end
