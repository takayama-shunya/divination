class AddIndexForStore < ActiveRecord::Migration[7.0]
  def change
    # storesテーブルに店舗名の全文検索用のインデックスを追加
    add_index :stores,  "to_tsvector('english', name)", using: :gin, name: 'stores_idx'
  end
end
