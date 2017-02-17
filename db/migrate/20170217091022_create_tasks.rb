class CreateTasks < ActiveRecord::Migration[5.0]
    create_table :tasks do |t|
      t.belongs_to :organization
      t.belongs_to :careplan
      t.belongs_to :task_type

      t.boolean :monday,    default: false, null: false
      t.boolean :tuesday,   default: false, null: false
      t.boolean :wednesday, default: false, null: false
      t.boolean :thursday,  default: false, null: false
      t.boolean :friday,    default: false, null: false
      t.boolean :saturday,  default: false, null: false
      t.boolean :sunday,    default: false, null: false

      t.timestamps
    end

    add_index :tasks, :organization_id
    add_index :tasks, :careplan_id
    add_index :tasks, :task_type_id
  end
end
