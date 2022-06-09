class CreateMasterplan2d < ActiveRecord::Migration[7.0]
  def change
    create_table :masterplan2ds do |t|
      t.string :imageurl
      t.string :name
      t.integer :orginalwidth
    end
  end
end
