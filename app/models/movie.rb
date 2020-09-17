class Movie < ApplicationRecord
  has_many :watched_movies, dependent: :destroy
  has_many :wish_lists, dependent: :destroy

end
