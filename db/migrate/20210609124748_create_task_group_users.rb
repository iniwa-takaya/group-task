class CreateTaskGroupUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :task_group_users do |t|
      t.references :user,       foreign_key: true
      t.references :task_group, foreign_key: true
      t.timestamps
    end
  end
end
