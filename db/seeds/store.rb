# 存在するcompanyのidを取得する
company_ids = Company.pluck(:id)
# ５大都市のidを取得する
prefecture_tokyo_id = Prefecture.find_by(name: '東京都').id
prefecture_osaka_id = Prefecture.find_by(name: '大阪府').id
prefecture_nagoya_id = Prefecture.find_by(name: '愛知県').id
prefecture_fukuoka_id = Prefecture.find_by(name: '福岡県').id
prefecture_sapporo_id = Prefecture.find_by(name: '北海道').id

Store.create!([
  { name: 'sample_store_1', company_id: company_ids.sample, prefecture_id: prefecture_tokyo_id, 
    address: '東京都渋谷区渋谷1-2-3', 
    phone_number: '111-1111-111', business_hours: '10:00〜22:00', url_path: 'htpps://sample_store_1.jp' },
  { name: 'sample_store_2', company_id: company_ids.sample, prefecture_id: prefecture_osaka_id, 
    address: '大阪府大阪市1-2-3', 
    phone_number: '222-2222-222', business_hours: '10:00〜22:00', url_path: 'htpps://sample_store_2.jp' },
  { name: 'sample_store_3', company_id: company_ids.sample, prefecture_id: prefecture_nagoya_id, 
    address: '愛知県名古屋市1-2-3', 
    phone_number: '333-3333-333', business_hours: '10:00〜22:00', url_path: 'htpps://sample_store_3.jp' },
  { name: 'sample_store_4', company_id: company_ids.sample, prefecture_id: prefecture_fukuoka_id, 
    address: '福岡県福岡市1-2-3', 
    phone_number: '444-4444-444', business_hours: '10:00〜22:00', url_path: 'htpps://sample_store_4.jp' },
  { name: 'sample_store_5', company_id: company_ids.sample, prefecture_id: prefecture_sapporo_id, 
    address: '北海道札幌市1-2-3', 
    phone_number: '555-5555-555', business_hours: '10:00〜22:00', url_path: 'htpps://sample_store_5.jp' },
            
])