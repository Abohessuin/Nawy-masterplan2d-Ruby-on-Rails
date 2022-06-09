class RenamePhasespropertiesColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :phasesproperties, :title, :nofbedrooms
    rename_column :phasesproperties, :garden, :hasgarden
    rename_column :phasesproperties, :roof, :hasroof
        #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
