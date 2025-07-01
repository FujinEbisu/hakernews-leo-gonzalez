class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :text
      t.integer :vote
      t.string :title
      t.string :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
