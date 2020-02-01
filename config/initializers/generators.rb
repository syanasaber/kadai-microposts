#このファイルはターミナルコマンドじゃなくて、手動で作成する必要あり

Rails.application.config.generators do |g|
    g.stylesheets false
    g.javascripts false
    g.helper false
    g.helper false
    g.skip_routes true
end

#上記コードで、CSSジャバスク、ヘルパーを除外


