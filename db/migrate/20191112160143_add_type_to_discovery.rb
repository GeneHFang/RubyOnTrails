class AddTypeToDiscovery < ActiveRecord::Migration[6.0]
  def change
    add_column :discoveries, :type, :string
  end
end
