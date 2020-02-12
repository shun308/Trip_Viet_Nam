class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :notes       
  has_many :favorites #User:Favorite => 1:多
  has_many :favorite_conversations
  has_many :items, through: :favorites
  has_many :conversations, through: :favorite_conversations
end
