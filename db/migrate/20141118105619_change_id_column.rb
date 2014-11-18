class ChangeIdColumn < ActiveRecord::Migration
  def change
  	change_column :gardeners, :id_number, :decimal
  end
end
