class Movie < ApplicationRecord
  has_many :watched_movies, dependent: :destroy
  has_many :wish_lists, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached :cover_pic
  has_one_attached :display_pic

end
