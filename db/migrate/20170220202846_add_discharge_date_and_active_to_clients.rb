class AddDischargeDateAndActiveToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :active, :boolean, default: true
    add_column :clients, :discharge_date, :date, default: nil
  end
end
