# frozen_string_literal: true

require 'rails_helper'

describe 'キーワード', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', password: 'password', activated: true) }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com', password: 'password', activated: true) }

  before do
    keyword_a = FactoryBot.create(:keyword, name: 'メチャカリ')
    FactoryBot.create(:users_keyword, user: user_a, keyword: keyword_a)

    visit login_path
    fill_in 'session_email', with: login_user.email
    fill_in 'session_password', with: login_user.password
    click_button 'login-btn'
  end

  shared_examples_for 'ユーザーAが作成したキーワードが表示される' do
    it { expect(page).to have_content 'メチャカリ' }
  end

  shared_examples_for 'ユーザーAが作成したキーワードが表示されない' do
    it { expect(page).to have_no_content 'メチャカリ' }
  end

  describe 'プロフィール表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザー名が表示される' do
        expect(page).to have_content user_a.name
      end

      it_behaves_like 'ユーザーAが作成したキーワードが表示される'
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }

      it_behaves_like 'ユーザーAが作成したキーワードが表示されない'
    end
  end

  describe 'キーワード一覧画面表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      before do
        visit keywords_path
      end

      it_behaves_like 'ユーザーAが作成したキーワードが表示される'
    end
  end

  describe '新規作成機能' do
    let(:login_user) { user_a }

    before do
      visit keywords_path
      fill_in 'keyword_name', with: keyword_registration
      click_button '登録'
    end

    context '一覧画面から新規作成をした時' do
      let(:keyword_registration) { 'Apple' }
      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: 'キーワード登録が完了!'
        expect(page).to have_selector '.keyword_list', text: 'Apple'
      end
    end

    context '一覧画面から空白を登録した時' do
      let(:keyword_registration) { '' }
      it 'エラーが出る' do
        within '.alert-danger' do
          expect(page).to have_content '登録文字が20文字を越えています'
        end
      end
    end

    context '一覧画面から21文字以上を登録した時' do
      let(:keyword_registration) { 'a' * 21 }
      it 'エラーが出る' do
        within '.alert-danger' do
          expect(page).to have_content '登録文字が20文字を越えています'
        end
      end
    end

    context '登録済みのキーワードを登録した時' do
      let(:keyword_registration) { 'メチャカリ' }
      it 'エラーが出る' do
        within '.alert-danger' do
          expect(page).to have_content '登録済みのキーワードです'
        end
      end
    end
  end

  describe '削除機能' do
    let(:login_user) { user_a }

    before do
      visit keywords_path
      click_on 'メチャカリ-delete'
    end
    context 'キーワードを削除した時' do
      it '削除完了メッセージが出る' do
        expect(page).to have_selector '.alert-success', text: '削除しました'
      end
      it_behaves_like 'ユーザーAが作成したキーワードが表示されない'
    end
  end
end
