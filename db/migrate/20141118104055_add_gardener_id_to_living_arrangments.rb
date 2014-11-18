class AddGardenerIdToLivingArrangments < ActiveRecord::Migration
  def change
  	add_column :living_arrangements, :gardener_id, :integer
  end
end
