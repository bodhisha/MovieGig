class Movie < ApplicationRecord
  has_many :watched_movies, dependent: :destroy
  has_many :wish_lists, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
