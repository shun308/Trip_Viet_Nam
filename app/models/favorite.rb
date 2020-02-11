class Favorite < ApplicationRecord
  #ユーザーが重複してお気に入りを登録するのを防ぐ
  validates :user_id, uniqueness:{scope: [:item_id]}

  belongs_to :user #User:Favorite => 1:多
  belongs_to :item #Item:Favorite => 1:多
end
