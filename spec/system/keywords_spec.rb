require 'rails_helper'

describe 'キーワード一覧画面', type: :system do
    describe 'ログイン後の画面表示' do
        let(:user_a) {FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com',password: 'password',activated: true)}
        let(:user_b) {FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com',password: 'password',activated: true)}

        before do
            keyword_a = FactoryBot.create(:keyword, name: 'メチャカリ')
            FactoryBot.create(:users_keyword, user: user_a,keyword: keyword_a)

            visit login_path
            fill_in 'session_email', with: login_user.email
            fill_in 'session_password', with: login_user.password
            click_button 'login-btn'

        end

        context 'ユーザーAがログインしているとき' do
            let(:login_user) {user_a}   
            it 'ユーザーAが登録したキーワードが表示される' do
                expect(page).to have_content 'メチャカリ'
            end
        end

        context 'ユーザーBがログインしているとき' do
            let(:login_user) {user_b}

            it 'ユーザーAが作成したキーワードが表示されない' do
                expect(page).to have_no_content 'メチャカリ'
            end
        end
    end
end