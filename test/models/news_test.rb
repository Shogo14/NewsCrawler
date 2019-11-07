require "test_helper"

class NewsTest < ActiveSupport::TestCase
  def setup
    keyword = Keyword.first
    @news = News.new( title: "News Title", 
                      content: "News Content",
                      img_src: "imgurl",
                      url: "urltest",
                      delivery_date: Time.zone.now,
                      delete_flg: false,
                      keyword_id: keyword.id
                      )
  end

  test "ニュースが存在する場合" do  
    assert @news.valid?
  end 
   
  test "ニュースタイトル、本文、URLが空白の場合" do
    @news.title = "     "
    assert_not @news.valid?

    @news.title = "News Title"
    @news.content = "     "
    assert_not @news.valid?

    @news.content = "News Content"
    @news.url = "     "
    assert_not @news.valid?
  end
 
  test "キーワードテーブルと紐づかないニュースの場合" do 
    @news.keyword_id = nil 
    assert_not @news.valid?
  end 

  test "ニュースタイトルが重複しているレコードが挿入できないかを確認" do
    duplicate_news = @news.dup
    duplicate_news.title = @news.title
    @news.save
    assert_not duplicate_news.valid?
  end

  test "ニュースURLが重複しているレコードが挿入できないかを確認" do
    duplicate_news = @news.dup
    duplicate_news.url = @news.url
    @news.save
    assert_not duplicate_news.valid?
  end

end
