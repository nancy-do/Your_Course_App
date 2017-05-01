class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :building, :null => false
      t.integer :level, :null => false
      t.integer :room, :null => false
      
      t.timestamps
    end
    
    #add_index :locations, [:building, :level, :room], :unique =>true, :name => 'index'
    
  end
end
