class ChangeIdColumnBack < ActiveRecord::Migration
  def change
  	change_column :gardeners, :id_number, :integer
  end
end
