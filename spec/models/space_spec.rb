require 'rails_helper'

RSpec.describe Space, type: :model do
  before do
    @space = FactoryBot.build(:space)
  end

  describe 'スペース機能' do
    
    context 'スペースが作成できる場合'do
      it '全ての情報があれば作成できる' do
        expect(@space).to be_valid
      end
      it 's_descriptionが空でも作成できる' do
        @space.s_description = ""
        expect(@space).to be_valid
      end
    end

    context 'スペースが作成できない場合' do
      it 'スペース名が空では作成できない' do
        @space.s_name = ""
        @space.valid?
        expect(@space.errors.full_messages).to include("作業スペースの名前を入力してください")
      end
    end

  end
end
