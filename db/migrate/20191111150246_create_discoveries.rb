class CreateDiscoveries < ActiveRecord::Migration[6.0]
  def change
    create_table :discoveries do |t|
      t.string :name
      t.integer :place_id

      t.timestamps
    end
  end
end
