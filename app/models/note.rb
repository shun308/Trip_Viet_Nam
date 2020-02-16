class Note < ApplicationRecord
  acts_as_taggable
  
  belongs_to :user

  validates :title, presence: true
end
