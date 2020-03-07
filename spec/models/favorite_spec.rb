require 'rails_helper'

describe Favorite do
  describe '#create' do

# 8. 重複したfavoriteが存在する場合登録できないこと
    it "is invalid with a duplicate favorite" do
      favorite = create(:favorite)
      another_favorite = build(:favorite)
      another_favorite.valid?
      expect(another_favorite.errors[:favorite]).to include("has already been taken")
    end
  end
end