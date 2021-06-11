class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content,    null: false
      t.timestamp :deadline
      t.boolean :status,    null: false, default: false
      t.references :task_group,  foreign_key: true
      t.references :space,  foreign_key: true
      t.timestamps
    end
  end
end
