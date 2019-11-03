module NewsHelper
    require 'open-uri'
    require 'nokogiri'
    require 'uri'
    require 'time'


    #TOPページからテーマとURLを取得
    def top_topic_url(url)

        doc = get_object(url)
        #Yahoo
        arr = {}
        doc.xpath('//li[@class="topicsListItem "]').each do |node|
            a = node.css('a')
            link = a.attribute('href').value
            title = node.content
            arr.store(title,link)
        end
        return arr
    end

    #キーワードからニュースをDBにインサート
    def keyword_get_news(keyword: "",keyword_id: nil)
        url = make_url(keyword)
        titles_urls = keyword_topic_url(url)
        titles_urls.each do |title,url|
            content = get_contents(url)
            img_src = get_img_url(url)
            delivery_date = get_deliveryDate(url)
            keyword_insert(title:         title,
                           content:       content,
                           img_src:       img_src,
                           url:           url,
                           delivery_date: delivery_date,
                           delete_flg:    false,
                           keyword_id:    keyword_id
                           )
        end
    end

    #Newsテーブルにデータをインサートする
    def keyword_insert(title: nil,content: nil,img_src: nil,url: nil,delivery_date: nil,delete_flg: false,keyword_id: nil)
        news = News.create(title:         title,
                        content:       content, 
                        img_src:       img_src,
                        url:           url, 
                        delivery_date: delivery_date, 
                        delete_flg:    delete_flg ,
                        keyword_id:    keyword_id
                        )
    end

    # KEYWORDからタイトルとURLを取得
    def keyword_topic_url(url)
        
        doc = get_object(url)
        #Yahoo
        arr = {}
        doc.css('div#NSm div h2').each do |node|
            a = node.css('a')
            link = a.attribute('href').value
            title = node.content
            arr.store(title,link)
        end
        return arr
    end

    # URLから記事の本文を取得
    def get_contents(url)
        url = get_detail_link(url)
        doc = get_object(url)
        contents = ""
        # ynDetailText
        doc.css('.yjDirectSLinkTarget').each {|dom| contents << dom.content} 

        if contents == ""
            doc.css('.ynDetailText').each {|dom| contents << dom.content} 
        end

        nlink = get_next(doc)

        contents << get_contents(nlink) unless nlink.nil?


        return contents
    end

    # URLから画像のソースを取得
    def get_img_url(url)
        url = get_detail_link(url)
        doc = get_object(url)
        img_src = nil

        doc.css('div.PhotosContainerMain img').each do |node|
            img_src = node.attribute('src').value
        end

        if img_src.nil?
            doc.css('div#mainPhoto img').each do |node|
                img_src = node.attribute('src').value
            end
        end

        return img_src
    end

    # URLから配信日を取得
    def get_deliveryDate(url)
        url = get_detail_link(url)
        doc = get_object(url)
        delivery_date = nil

        doc.css('div.hdLogoWrap p.source').each {|node| delivery_date = node.text}
        unless delivery_date.nil?
            delivery_date = delivery_date.sub!(/配信/, '').sub!(/\([月火水木金土日]\)/, '')  
            delivery_date = Time.strptime(delivery_date, "%m/%d %H:%M")
        else
            doc.css('p.ymuiDate').each {|node| delivery_date = node.text}
            delivery_date = delivery_date.sub!(/配信/, '').sub!(/\([月火水木金土日]\)/, '').sub!(/時事通信/, '') 
            delivery_date = Time.strptime(delivery_date, "%m/%d %H:%M")
        end
        
        return delivery_date
    end

    #「続きを読む」リンクを探す
    def get_detail_link(url)
        doc = get_object(url)
        
        link = nil
        doc.css('p.tpcNews_detailLink').each do |detail|
            link = detail.css('a').attribute('href').value
        end
        #「続きを読む」リンクがない場合元のURLを返す
        link = url if link.nil?

        return link
    end



    private
        # URLからDOM要素を取得
        def get_object(url)
            charset = nil
            html = open(url) do |f|
                charset = f.charset # 文字種別を取得
                f.read # htmlを読み込んで変数htmlに渡す
            end
            # htmlをパース(解析)してオブジェクトを作成
            doc = Nokogiri::HTML.parse(html, nil, charset)
            return doc
        end

        def get_next(doc)
            nlink = nil
            doc.css('li.next a').each do |node|
                nlink = node.attribute('href').value
            end
            return nlink  
        end

          # キーワードごとのYahoo用ニュースURLを返す
        def make_url(keyword)
            ec_keyword = URI.encode(keyword)
            url = "https://news.yahoo.co.jp/search/?p=#{ec_keyword}&ei=utf-8&fr=news_sw"
            return url
        end
end
