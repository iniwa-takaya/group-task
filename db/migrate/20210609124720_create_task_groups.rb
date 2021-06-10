class CreateTaskGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :task_groups do |t|
      t.string :g_name, null: false
      t.string :g_description
      t.timestamps
    end
  end
end
