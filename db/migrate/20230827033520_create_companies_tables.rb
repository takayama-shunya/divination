class CreateCompaniesTables < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name,               null: false, limit: 50
      t.string :group_name,         null: false, limit: 50
      t.timestamps
    end
  end
end
