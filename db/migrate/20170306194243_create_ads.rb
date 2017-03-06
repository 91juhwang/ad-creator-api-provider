class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :title
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
