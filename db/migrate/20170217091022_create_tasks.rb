class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :careplan, index: true
      t.belongs_to :task_type, index: true

      t.boolean :monday,    default: false, null: false
      t.boolean :tuesday,   default: false, null: false
      t.boolean :wednesday, default: false, null: false
      t.boolean :thursday,  default: false, null: false
      t.boolean :friday,    default: false, null: false
      t.boolean :saturday,  default: false, null: false
      t.boolean :sunday,    default: false, null: false

      t.timestamps
    end
  end
end
