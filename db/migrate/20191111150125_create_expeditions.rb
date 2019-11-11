class CreateExpeditions < ActiveRecord::Migration[6.0]
  def change
    create_table :expeditions do |t|
      t.integer :place_id
      t.integer :explorer_id

      t.timestamps
    end
  end
end
