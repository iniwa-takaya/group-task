class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :s_name, null: false, unique: true
      t.string :s_description
      t.references :task_group, foreign_key: true
      t.timestamps
    end
  end
end
