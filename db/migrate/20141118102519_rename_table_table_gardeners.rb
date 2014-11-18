class RenameTableTableGardeners < ActiveRecord::Migration
  def change
  	rename_table :table_gardeners, :gardeners
  end
end
