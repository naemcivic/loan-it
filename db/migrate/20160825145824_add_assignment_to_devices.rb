class AddAssignmentToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :assigned, :boolean
  end
end
