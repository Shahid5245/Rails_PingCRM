class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.belongs_to :organization, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :region
      t.string :country
      t.string :postal_code
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
