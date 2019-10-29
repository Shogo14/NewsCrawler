module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "News Crawler"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def each_show_news(id)
    news = News.where(keyword_id: id)
  end

  def active_class?(id)
    return 'active' if params[:id] == id.to_s
  end


end
