class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, default: ""
      t.has_many :users
      t.has_many :providers
      t.has_many :clients
      t.has_many :careplans
      t.has_many :default_tasks
      t.timestamps
    end
  end
end
