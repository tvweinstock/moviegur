class AddDetailsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :release_year, :integer
    add_column :movies, :duration, :integer
  end
end
