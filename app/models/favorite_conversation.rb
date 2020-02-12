class FavoriteConversation < ApplicationRecord
  validates :user_id, uniqueness:{scope: [:conversation_id]}

  belongs_to :user
  belongs_to :conversation
end
