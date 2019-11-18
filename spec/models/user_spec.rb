require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { FactoryBot.create(:user) }

    describe 'ユーザー登録できる場合' do
        it '新規登録できること' do
          expect(user).to be_valid
        end
    end

    describe 'ユーザー名を検証する場合' do
        it 'ユーザー名が無いと無効な状態であること' do
          user.name = nil
          user.valid?
          expect(user.errors[:name]).to include("can't be blank")
        end
    
        it 'ユーザー名が50文字なら有効な状態であること' do
          user.name = 'a' * 50
          user.valid?
          expect(user).to be_valid
        end
    
        it 'ユーザー名が50文字超なら無効な状態であること' do
          user.name = 'a' * 51
          user.valid?
          expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
        end
    end

    describe 'メールアドレスを検証する場合' do
        it 'メールアドレスが無いと無効な状態であること' do
          user.email = nil
          user.valid?
          expect(user.errors[:email]).to include("can't be blank")
        end

        it '@が含まれていないと無効な状態であること' do
          user.email = 'test.co.test'
          user.valid?
          expect(user.errors[:email]).to include("is invalid")
        end

        it '255文字超なら無効な状態であること' do
          user.email = 'a'*256
          user.valid?
          expect(user.errors[:email]).to include("is invalid")
        end

        it '重複したメールアドレスなら無効な状態であること' do
          FactoryBot.create(:user, email: 'tester@example.jp')
          user.email = 'tester@example.jp'
          user.valid?
          expect(user.errors[:email]).to include("has already been taken")
        end

        it '「、」が入っている場合無効な状態であること' do
          user.email = 'user@example,com'
          user.valid?
          expect(user.errors[:email]).to include("is invalid")
        end

        it '「.」で終わっている場合無効な状態であること' do
          user.email = 'user.name@example.'
          user.valid?
          expect(user.errors[:email]).to include("is invalid")
        end

        it '@の後ろに「_」が含まれる場合無効な状態であること' do
          user.email = 'foo@bar_baz.com'
          user.valid?
          expect(user.errors[:email]).to include("is invalid")
        end

        it '@の後ろに「+」が含まれる場合無効な状態であること' do
          user.email = 'foo@bar+baz.com'
          user.valid?
          expect(user.errors[:email]).to include("is invalid")
        end

        it 'メールアドレスが保存される前に小文字に変換されること' do
          user.email = 'TESTADD@supplebox.jp'
          user.save
          expect(user.email).to eq 'testadd@supplebox.jp'
        end
    end

    describe 'パスワードを検証する場合' do
        it 'パスワードが無いと無効な状態であること' do
          user.password = nil
          user.valid?
          expect(user.errors[:password]).to include("can't be blank")
        end

        it '7文字以下なら無効な状態であること' do
          user.password = 'a'*7
          user.valid?
          expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
        end

        it 'パスワードと確認用パスワードが一致していないと無効な状態であること' do
          user.password = 'password'
          user.password_confirmation = 'invalid_password'
          user.valid?
          expect(user.errors[:password_confirmation]).to include("doesn't match Password")
        end
    end

end