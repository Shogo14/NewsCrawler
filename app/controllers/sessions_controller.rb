# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = 'ログインしました。'
        redirect_back_or user
      else
        message  = 'Account not activated. '
        message += 'Check your email for the activation link.'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'メールアドレス、もしくはパスワードに誤りがあります'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def testlogin
    test_login
  end

  private

  def test_login
    user = User.find_by(email: 'example@railstutorial.org')
    user.authenticate('foobarzoo')
    log_in user
    remember(user)
    redirect_back_or user
  end
end
