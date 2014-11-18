class CreateTableGardeners < ActiveRecord::Migration
  def change
    create_table :table_gardeners do |t|
    	t.string :first_name
    	t.string :last_name
    	t.integer :id_number
    	t.integer :age
    	t.string :gender

    end
  end
end
