class AddValueToDiscoveries < ActiveRecord::Migration[6.0]
  def change
    add_column :discoveries, :value, :integer
  end
end
