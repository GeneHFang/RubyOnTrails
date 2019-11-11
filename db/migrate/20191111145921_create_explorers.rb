class CreateExplorers < ActiveRecord::Migration[6.0]
  def change
    create_table :explorers do |t|
      t.string :name
      t.integer :money
      t.integer :rations
      t.integer :user_id

      t.timestamps
    end
  end
end
