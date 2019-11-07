require 'test_helper'

class KeywordTest < ActiveSupport::TestCase

  def setup
    @keyword = Keyword.new(name: "test", delete_flg: false)
  end

  test "キーワードが存在する場合" do
    assert @keyword.valid?
  end
  
  test "キーワードが空白の場合" do
    @keyword.name = "     "
    assert_not @keyword.valid?
  end

  test "キーワードが21文字以上の場合" do
    @keyword.name = "a"*21
    assert_not @keyword.valid?
  end

  test "キーワードが重複しているレコードが挿入できないかを確認" do
    duplicate_keyword = @keyword.dup
    duplicate_keyword.name = @keyword.name
    @keyword.save
    assert_not duplicate_keyword.valid?
  end
end
