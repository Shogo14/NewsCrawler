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

  def active_class?(id)
    #0の場合はAllをactiveとする
    return 'active' if params[:id] == id.to_s || id.to_s == "0"
  end

  #自分が所有するキーワードを返す
  def own_keywords
    current_user.keywords.order(created_at: "asc")
  end


end
