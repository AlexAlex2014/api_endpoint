class CreateExcavators < ActiveRecord::Migration[5.2]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.string :address
      t.string :crew_on_site

      t.timestamps
    end
  end
end
