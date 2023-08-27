class CreateScoresTables < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :score,             null: false, limit: 2
      t.references :user,           foreign_key: true
      t.references :store,          foreign_key: true
      t.integer :place,            limit: 2
      t.integer :rank,             limit: 2
      t.integer :type,             limit: 2
      t.datetime :scored_at,        null: false
      t.timestamps
    end
  end
end
