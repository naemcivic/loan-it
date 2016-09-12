class AddSignatureimageToLoans < ActiveRecord::Migration[5.0]
  def change
  	add_column :loans, :signature_image, :string
  end
end
