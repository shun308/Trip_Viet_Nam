class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :favorites #User:Favorite => 1:多
  has_many :items, through: :favorites
end
