module NewsHelper
    def crawller
        require 'open-uri'
        require 'nokogiri'

        # スクレイピング先のURL
        # url = 'http://matome.naver.jp/tech'
        url = 'https://news.yahoo.co.jp/'

        # charset = nil
        # html = open(url) do |f|
        #     charset = f.charset # 文字種別を取得
        #     f.read # htmlを読み込んで変数htmlに渡す
        # end
        html = open(url)

        # htmlをパース(解析)してオブジェクトを作成
        # doc = Nokogiri::HTML.parse(html, nil, charset)
        doc = Nokogiri::HTML.parse(html,nil)

        #NAVER 
        # doc.xpath('//li[@class="mdTopMTMList01Item"]').each do |node|
        #Yahoo
        # docs = doc.xpath('//li[@class="topicsListItem "]')
        # p docs.size
        doc.xpath('//li[@class="topicsListItem "]').each do |node|
            # tilte
            # puts node.css('a').inner_text
            
            p  node.content
            # out =  node.css('a').content

            # # 記事のサムネイル画像
            # p node.css('img').attribute('src').value

            # # 記事のサムネイル画像
            # p node.css('a').attribute('href').value
        end
    end
end
