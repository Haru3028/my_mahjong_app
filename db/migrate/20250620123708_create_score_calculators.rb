class CreateScoreCalculators < ActiveRecord::Migration[8.0]
  def change
    create_table :score_calculators do |t|
      t.json :hand_tiles
      t.integer :result_score
      t.text :notes

      t.timestamps
    end
  end
end
