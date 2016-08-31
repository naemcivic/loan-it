class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.text :signature

      t.timestamps
    end
  end
end
