class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.belongs_to :organization, index: true
      t.string :last_name
      t.string :first_name
      t.string :medicaid
      t.string :ssi
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :case_manager
      t.string :manager_phone
      t.date :date_of_birth
      t.date :par_expiration
      t.text :emergency_contact_info
      t.string :hours_plus_travel
      t.integer :units, default: 0
      t.date :last_home_visit
      t.string :languages
      t.date :advanced_directive

      t.timestamps
    end
  end
end
