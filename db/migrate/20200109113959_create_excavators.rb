class CreateExcavators < ActiveRecord::Migration[5.2]
  def change
    create_table :excavators do |t|

      t.timestamps
    end
  end
end
