class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.belongs_to :user, index: true

      t.string :name
      t.integer :id_number

      t.timestamps
    end
  end
end
