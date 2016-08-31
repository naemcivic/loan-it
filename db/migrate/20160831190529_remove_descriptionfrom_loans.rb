class RemoveDescriptionfromLoans < ActiveRecord::Migration[5.0]
  def change
  	remove_column :loans, :description, :text
  end
end
