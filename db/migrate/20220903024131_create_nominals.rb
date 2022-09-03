class CreateNominals < ActiveRecord::Migration[7.0]
  def change
    create_table :nominals do |t|
      t.string :username
      t.integer :amount

      t.timestamps
    end
  end
end
