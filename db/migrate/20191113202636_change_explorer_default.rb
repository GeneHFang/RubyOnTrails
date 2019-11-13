class ChangeExplorerDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :explorers, :money, 0
    change_column_default :explorers, :rations, 100
  end
end
