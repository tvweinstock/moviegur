class RemoveActorsFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :actors, :string
  end
end
