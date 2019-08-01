class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :name
      t.references :first_team, foreign_key: { to_table: :teams }
      t.references :second_team, foreign_key: { to_table: :teams }
      t.timestamps
    end
  end
end
