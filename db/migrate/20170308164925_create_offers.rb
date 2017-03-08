class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :price
      t.string :message
      t.references :user, foreign_key: true
      t.references :ad, foreign_key: true

      t.timestamps
    end
  end
end
