# frozen_string_literal: true

FactoryBot.define do
    factory :news do
      title { 'News1' }
      content { 'News1 のコンテンツです。こちらに記事の本文が入ります。' }
      img_src { 'test' }
      url { 'testurl' }
      delivery_date { '2019/11/15 17:43:00' }
      delete_flg { false }
      keyword
    end
  end