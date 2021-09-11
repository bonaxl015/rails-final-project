class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :caption
      t.string :image

      t.timestamps
    end
  end
end
