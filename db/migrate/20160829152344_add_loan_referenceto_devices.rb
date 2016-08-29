class AddLoanReferencetoDevices < ActiveRecord::Migration[5.0]
  def change
  	add_column  :devices, :loan_id, :integer
  end
end
