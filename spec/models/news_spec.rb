require 'rails_helper'

RSpec.describe News, type: :model do
    let(:news) { FactoryBot.create(:news) } 
    let(:keyword) { FactoryBot.create(:keyword) }      

    describe 'ニュース登録できる場合' do
        it '新規登録できること' do
          expect(news).to be_valid
        end
    end

    describe '記事本文を検証する場合' do
        it '空白の場合無効な状態である事' do
            news.content = nil
            news.valid?
            expect(news.errors[:content]).to include("can't be blank")
        end
    end
    
    describe 'タイトルを検証する場合' do
        it '空白の場合無効な状態である事' do
            news.title = nil
            news.valid?
            expect(news.errors[:title]).to include("can't be blank")
        end

        it '重複登録した場合無効な状態である事' do
            FactoryBot.create(:news, title: '日経について',content: 'testB', url: 'testB', keyword: keyword)
            news_a = News.create(title: '日経について')
            news_a.valid?
            expect(news_a.errors[:title]).to include("has already been taken")
        end
    end


    describe 'URLを検証する場合' do
        it '空白の場合無効な状態である事' do
            news.url = nil
            news.valid?
            expect(news.errors[:url]).to include("can't be blank")
        end

        it '重複登録した場合無効な状態である事' do
            FactoryBot.create(:news, title: '日経について',content: 'testB', url: 'testB', keyword: keyword)
            news_a = News.create(url: 'testB')
            news_a.valid?
            expect(news_a.errors[:url]).to include("has already been taken")
        end
    end
end