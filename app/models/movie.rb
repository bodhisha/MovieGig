class Movie < ApplicationRecord
  has_many :watched_movies, dependent: :destroy
end
