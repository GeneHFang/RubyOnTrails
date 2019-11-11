class AddHasWeaponToExpedition < ActiveRecord::Migration[6.0]
  def change
    add_column :expeditions, :hasWeapon, :boolean, default: false
    add_column :expeditions, :hasGuide, :boolean, default: false
  end
end
