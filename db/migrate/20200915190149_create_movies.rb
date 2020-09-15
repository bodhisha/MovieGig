class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.string :movie_genre
      t.string :movie_director
      t.integer :movie_rating

      t.timestamps
    end
  end
end
