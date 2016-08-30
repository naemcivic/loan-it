class AddDeviceReferenceToLoans < ActiveRecord::Migration[5.0]
  def change
  	add_column :loans, :device_id, :integer
  end
end
