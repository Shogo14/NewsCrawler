# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'bootstrap', '~> 4.1.1'
gem 'bootstrap-sass', '>= 3.4.1'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'faker', '1.7.3'
gem 'font-awesome-sass', '~> 5.4.1'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'whenever', require: false
gem 'will_paginate', '3.1.7'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks', '~> 5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'gravtastic'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'nokogiri', '~> 1.10', '>= 1.10.4'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.11'
  gem 'rufo'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # 静的解析ツール
  gem 'rubocop', require: false

  gem 'graphviz', '~> 0.4.0'

  # セキュリティチェック
  gem 'brakeman'
  # Gemバージョンチェック
  gem 'bundler-audit'
  # 開発環境にてリクエストの所要時間のチェック
  gem 'rack-mini-profiler'
  # デバッグ画面のリッチ化
  gem 'better_errors'
  gem 'binding_of_caller'
  # ER図の自動作成
  gem 'rails-erd'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  # gem "capybara-webkit",  "~>1.1.0"
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'guard', '2.13.0'
  gem 'guard-minitest', '2.4.4'
  gem 'minitest', '5.10.3'
  gem 'minitest-reporters', '1.1.14'
  gem 'rails-controller-testing', '1.0.2'
  gem 'rspec-rails', '~> 3.7'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
