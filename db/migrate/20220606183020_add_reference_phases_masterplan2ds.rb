class AddReferencePhasesMasterplan2ds < ActiveRecord::Migration[7.0]
  def change
    add_reference :phases, :masterplan2d, index: true
  end
end
