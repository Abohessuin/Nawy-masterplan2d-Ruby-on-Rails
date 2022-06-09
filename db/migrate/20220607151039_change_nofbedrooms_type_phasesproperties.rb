class ChangeNofbedroomsTypePhasesproperties < ActiveRecord::Migration[7.0]
  def change
    change_column :phasesproperties, :nofbedrooms,  :integer
    
  end
end
