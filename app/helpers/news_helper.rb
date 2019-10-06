module NewsHelper
    require 'open-uri'
    require 'nokogiri'

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

        doc.css('.yjDirectSLinkTarget').each {|dom| contents << dom.content} 

        nlink = get_next(doc)

        contents << get_contents(nlink) unless nlink.nil?

        return contents
    end

    def get_img_url(url)
        url = get_detail_link(url)
        doc = get_object(url)
        img_src = nil

        doc.css('div.PhotosContainerMain img').each do |node|
            img_src = node.attribute('src').value
        end

        return img_src
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
end
