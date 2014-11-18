class CreateTableLivingArrangements < ActiveRecord::Migration
  def change
    create_table :living_arrangements do |t|
    	t.string :relationship_to_hh
    	t.integer :number_of_people_in_household
    	t.integer :number_of_people_in_household_adults
    	t.integer :number_of_people_in_household_children
    	t.string :housing_type
    	t.string :location
    end
  end
end
