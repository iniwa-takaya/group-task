require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'task機能' do
    
    context 'タスクが作成できる場合' do
      it '全ての情報があれば作成できる' do
        expect(@task).to be_valid
      end
      it '日付が存在しない場合でも作成できる' do
        @task.deadline = ""
        expect(@task).to be_valid
      end
      it '日付がnilの場合でも作成できる' do
        @task.deadline = nil
        expect(@task).to be_valid
      end
    end

    context 'タスクが作成できない場合' do
      it 'contentが空では作成できない' do
        @task.content = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("タスクの内容を入力してください")
      end
      it 'statusが空では作成できない' do
        @task.status = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("タスクの条件は一覧にありません")
      end
      it 'deadlineが過去の日時の場合は作成できない' do
        @task.deadline = Date.yesterday
        @task.valid?
        expect(@task.errors.full_messages).to include("タスクの期限を過去の日時で設定することはできません")
      end
    end

  end
end
