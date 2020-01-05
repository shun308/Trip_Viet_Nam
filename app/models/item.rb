class Item < ApplicationRecord
  has_many :favorites #User:Favorite => 1:多
  has_many :users, through: :favorites
end
