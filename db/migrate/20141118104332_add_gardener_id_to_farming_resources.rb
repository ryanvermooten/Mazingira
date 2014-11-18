class AddGardenerIdToFarmingResources < ActiveRecord::Migration
  def change
  	add_column :farming_resources, :gardener_id, :integer
  end
end
