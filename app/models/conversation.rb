class Conversation < ApplicationRecord
  has_many :favorite_conversations
  has_many :users, through: :favorite_conversations
end
