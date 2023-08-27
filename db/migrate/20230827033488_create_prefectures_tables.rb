class CreatePrefecturesTables < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.string :name,               null: false, limit: 20
      t.timestamps
    end
  end
end
