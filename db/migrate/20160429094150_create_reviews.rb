class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :movie
      t.text :text
      t.integer :rating_out_of_ten

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :movie_id
  end
end
