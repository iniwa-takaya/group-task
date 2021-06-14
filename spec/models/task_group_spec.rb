require 'rails_helper'

RSpec.describe TaskGroup, type: :model do
  before do
    @task_group = FactoryBot.build(:task_group)
  end

  describe 'グループ機能' do
    
    context 'グループが作成できる場合' do
      it 'すべての情報がある場合作成できる' do
        expect(@task_group).to be_valid
      end
      it 'g_descriptionが空でも登録できる' do
        @task_group.g_description = ""
        expect(@task_group).to be_valid
      end
    end

    context 'グループが作成できない場合' do
      it 'g_nameが空では作成できない' do
        @task_group.g_name = ""
        @task_group.valid?
        expect(@task_group.errors.full_messages).to include("チーム名を入力してください")
      end
    end

  end
end
