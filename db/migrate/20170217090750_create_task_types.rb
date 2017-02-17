class CreateTaskTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :task_types do |t|
      t.belongs_to :organization, index: true

      t.string  :name, null: false
      t.boolean :homemaking, default: false, null: false
      t.integer :value, default: 0, null: false

      t.timestamps
    end
  end
end
