class Movie < ApplicationRecord
  validates :title, uniqueness: true
  validates :year, numericality: { greater_than: 1950 }
  validates :plot, uniqueness: true
end
