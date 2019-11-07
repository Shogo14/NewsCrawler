require "test_helper"

class UsersKeywordTest < ActiveSupport::TestCase
  def setup
    @keyword = Keyword.first
    @user = User.first
    @users_keyword = UsersKeyword.new(user_id:    @user.id,
                                      keyword_id: @keyword.id,
                                      delete_flg: false
                                      )
  end

  test "UserKeywordが存在する場合" do  
    assert @users_keyword.valid?
  end 

  test "UserからKeywordを取得できるか" do 
    users_keywords = @user.keywords 
    assert_not users_keywords.nil?
  end 

end
