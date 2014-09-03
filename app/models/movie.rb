class Movie < ActiveRecord::Base
  validates :title, :release_year, presence: true
  validates :duration, numericality: {only_integer: true}
end
