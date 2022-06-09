class DropPhases < ActiveRecord::Migration[7.0]
  def change
    drop_table :phases
  end
end
