require 'rails_helper'

RSpec.describe Keyword, type: :model do
    let(:keyword) { FactoryBot.create(:keyword) }

    describe 'キーワード登録できる場合' do
        it '新規登録できること' do
          expect(keyword).to be_valid
        end
    end

    describe 'キーワード名を検証する場合' do
        it '空白の場合無効な状態である事' do
            keyword.name = nil
            keyword.valid?
            expect(keyword.errors[:name]).to include("can't be blank")
        end

        it '20文字超の場合無効な状態である事' do
            keyword.name = 'a'*21
            keyword.valid?
            expect(keyword.errors[:name]).to include("is too long (maximum is 20 characters)")
        end

        it '重複登録した場合無効な状態である事' do
            FactoryBot.create(:keyword, name: '日経株価')
            keyword.name = '日経株価'
            keyword.valid?
            expect(keyword.errors[:name]).to include("has already been taken")
        end
    end
end