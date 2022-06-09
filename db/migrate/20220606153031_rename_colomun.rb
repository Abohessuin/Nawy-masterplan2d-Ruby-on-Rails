class RenameColomun < ActiveRecord::Migration[7.0]
  def change
    change_column :phases ,:masterplan2ds_id,:masterplan2d_id
  end
end
