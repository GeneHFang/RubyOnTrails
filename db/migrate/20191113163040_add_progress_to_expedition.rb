class AddProgressToExpedition < ActiveRecord::Migration[6.0]
  def change
    add_column :expeditions, :progress, :integer, :default => 1
  end
end
