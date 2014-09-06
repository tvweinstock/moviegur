class Movie < ActiveRecord::Base
  validates :title, :release_year, presence: true
  validates :duration, numericality: {only_integer: true}

  has_many :reviews
  has_many :users, through: :reviews

  def formatted_duration
    time_in_hours = duration.to_f / 60.0
    sprintf("%.2f", time_in_hours)  
  end
end
