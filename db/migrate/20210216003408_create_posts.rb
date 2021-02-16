class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :account
      t.references :course
      t.string :title
      t.text :body
      t.integer :like, default: 0
      t.integer :dislike, default: 0
      t.integer :total_comments, default: 0

      t.timestamps
    end
  end
end
