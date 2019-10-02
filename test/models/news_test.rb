require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  def setup
    @news = News.new(source_id: 1,
                     title: "日本勝利！", 
                     contents: "ラグビー日本代表がアイルランド代表に奇跡的に勝利しました",
                     img_src: "",
                     url: "",
                     delivery_date: "2019-09-28 21:00:00",
                     delete_flg: false)
  end

  test "news valid" do
    assert @news.valid?
  end
end
