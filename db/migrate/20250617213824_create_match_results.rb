class CreateMatchResults < ActiveRecord::Migration[8.0]
  def change
    create_table :match_results do |t|
      t.string :user_name
      t.integer :score
      t.date :date

      t.timestamps
    end
  end
end
