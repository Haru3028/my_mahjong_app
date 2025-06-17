class CreateMyHands < ActiveRecord::Migration[8.0]
  def change
    create_table :my_hands do |t|
      t.jsonb :hand_data
      t.integer :score
      t.string :yaku_name
      t.date :date
      t.string :round_info

      t.timestamps
    end
  end
end
