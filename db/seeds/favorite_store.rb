# testユーザーを取得
test_user = User.find_by(name: 'test')&.id
# 店舗IDを2つ取得
store_ids = Store.pluck(:id).sample(3)

if !test_user.nil?
  store_ids.each do |store_id|
    FavoriteStore.create!(user_id: test_user, store_id: store_id)
  end
else
  puts "testユーザーが存在しません。"
end
    
