class CreateNorseRunes < ActiveRecord::Migration[7.0]
  def change
    create_table :nordic_runes do |t|
      t.string :name
      t.string :meaning
      t.string :latin_letters_transcription
      t.string :normal_position
      t.string :inverted_position
      t.string :color
      t.timestamps
    end
  end
end
