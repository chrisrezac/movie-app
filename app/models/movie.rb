class Movie < ApplicationRecord

  has_many :actors
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  # validates :title, uniqueness: true
  # validates :year, numericality: { greater_than: 1950 }
  # validates :plot, uniqueness: true
end
