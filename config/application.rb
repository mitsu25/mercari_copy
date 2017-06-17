require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module MercariCopy
  class Application < Rails::Application

    #controller生成時に不要ファイルを作成しない設定
    config.generators do |g|
      g.javascripts    false
      g.helper         false
      g.test_framework false
      g.scss           false
    end

  end
end
