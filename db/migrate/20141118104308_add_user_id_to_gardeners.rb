class AddUserIdToGardeners < ActiveRecord::Migration
  def change
  	add_column :gardeners, :user_id, :integer
  end
end
