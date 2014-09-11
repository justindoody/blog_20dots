class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :post
      t.string :cover_photo

      t.timestamps
    end
  end
end
