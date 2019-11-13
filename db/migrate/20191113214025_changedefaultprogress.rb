class Changedefaultprogress < ActiveRecord::Migration[6.0]
  def change
    change_column_default :expeditions, :progress, 1
  end
end
