class WishList < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
