require 'rails_helper'

describe Note do
  describe '#create' do
     # 2. titleが空では登録できないこと
     it "is invalid without a title" do
      note = build(:note, title: nil)
      note.valid?
      expect(note.errors[:title]).to include("can't be blank")
    end
  end
end
