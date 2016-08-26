class CreateTransferofOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :transferof_ownerships do |t|

      t.timestamps
    end
  end
end
