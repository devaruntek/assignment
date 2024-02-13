class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phone
      t.string :address
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
