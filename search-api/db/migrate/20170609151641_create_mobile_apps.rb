class CreateMobileApps < ActiveRecord::Migration[5.1]
  def change
    create_table :mobile_apps do |t|
      t.string :category
      t.integer :rating
      t.string :name
      t.string :image
      t.string :link
      t.integer :rating_count
      t.string :price

      t.timestamps
    end
  end
end
