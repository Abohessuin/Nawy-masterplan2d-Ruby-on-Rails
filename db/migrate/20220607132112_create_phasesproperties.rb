class CreatePhasesproperties < ActiveRecord::Migration[7.0]
  def change
    create_table :phasesproperties do |t|
       t.string :phasename
       t.string :propertytype
       t.integer :price
       t.integer :area
       t.boolean :garden
       t.boolean :title
       t.boolean :roof
    end
  end
end
