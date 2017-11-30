class CreateSpotlightMainNavigations < ActiveRecord::Migration[5.0]
  def change
    create_table :spotlight_main_navigations do |t|
      t.string :label
      t.integer :weight, default: 20
      t.string :nav_type
      t.references :exhibit
      t.timestamps
    end
  end
end
