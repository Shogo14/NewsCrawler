# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include NewsHelper
  include KeywordsHelper

  def users_keyword_ids
    current_user.users_keywords.pluck(:keyword_id)
  end

  private

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
