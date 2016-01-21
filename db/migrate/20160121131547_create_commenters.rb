class CreateCommenters < ActiveRecord::Migration
  def change
    create_table :commenters do |t|
      t.text :comments
      t.references :user, index: true, foreign_key: true
      t.references :micropost, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
