class RemoveIdNumberFromDevice < ActiveRecord::Migration[5.0]
  def change
  	remove_column :devices, :id_number, :integer
  end
end
