class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :image_url
      t.string :name
      t.text :caption

      t.timestamps
    end
  end
end
