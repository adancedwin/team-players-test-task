class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :player_results do |t|
      t.string :name
      t.references :match, foreign_key: true
      t.references :player, foreign_key: true
      t.string :timestamps
    end
  end
end
