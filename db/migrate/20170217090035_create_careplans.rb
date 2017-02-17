class CreateCareplans < ActiveRecord::Migration[5.0]
  def change
    create_table :careplans do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :client, index: true
      t.belongs_to :provider, index: true

      t.boolean :relative_care, default: false, null: false
      t.date    :start_date
      t.string  :procedure_code
      
      t.timestamps
    end
  end
end
