class CreatePhases < ActiveRecord::Migration[7.0]
  def change
    create_table :phases do |t|
      t.string :name
      t.json   :phasedetails
    
    end
    add_reference :phases, :masterplan2d, index: true
  end
end
