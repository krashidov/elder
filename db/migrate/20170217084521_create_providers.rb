class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.belongs_to :organization, index: true
      t.string :last_name
      t.string :first_name
      t.string :ssi
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :hours_plus_travel
      t.date :date_of_birth
      t.string :emergency_contact_info
      t.integer :units, default: 0
      t.date :staff_evaluation_date
      t.date :safety_training_date
      t.string :supervisor
      t.string :language
      t.date :id_expiration_date
      t.date :work_authorization_expiration
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
