class AddGroupReferenceToDevices < ActiveRecord::Migration[5.0]
  def change
  	add_column  :devices, :group_id, :integer
  end
end
