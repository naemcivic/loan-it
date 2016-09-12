class RemoveSignatureImage < ActiveRecord::Migration[5.0]
  def change
  	remove_column :loans, :signature_image, :string
  end
end
