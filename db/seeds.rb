# db/seeds配下にあるファイルは、rails db:seedコマンドで実行する
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end
