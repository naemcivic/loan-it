class ChangeSignatureFromTextToString < ActiveRecord::Migration[5.0]
  def change
  	change_column :loans, :signature, :string
  end
end
