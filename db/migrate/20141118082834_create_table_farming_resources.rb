class CreateTableFarmingResources < ActiveRecord::Migration
  def change
  	create_table :farming_resources do |t|
  		t.integer :number_of_people_engaged_in_farming
  		t.integer :number_of_farming_spaces
  		t.string :type_of_farming_space
  		t.string :size_of_farming_space
  		t.string :financial_capital_for_farming
  		end
	end
end
