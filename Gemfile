source "https://rubygems.org"

ruby "3.2.0"

# Rails本体
gem "rails", "~> 7.1.0"
gem "sprockets-rails"

# Puma Webサーバー
gem "puma", ">= 5.0"

# フロント周り
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# 画像処理
gem "mini_magick"
gem "image_processing", "~> 1.2"

# タイムゾーン
gem "tzinfo-data", platforms: %i[windows jruby]

# パフォーマンス
gem "bootsnap", require: false

# 認証
gem "devise", "~> 4.9"

# ----------------------
# データベース
# ----------------------
# 開発・テストは MySQL
group :development, :test do
  gem "mysql2", "~> 0.5"
end

# 本番は PostgreSQL
group :production do
  gem "pg", ">= 1.1", "< 2.0"
end

# ----------------------
# 開発用便利ツール
# ----------------------
group :development do
  gem "web-console"
  gem "debug", platforms: %i[mri windows]
end

# ----------------------
# テスト用
# ----------------------
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
