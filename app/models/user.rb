class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :notes, dependent: :delete_all
  has_many :favorites, dependent: :delete_all
  has_many :favorite_conversations, dependent: :delete_all
  has_many :items, through: :favorites
  has_many :conversations, through: :favorite_conversations

  validates :name, presence: true, length: { maximum: 10 }
end