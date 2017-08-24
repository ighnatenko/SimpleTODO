class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :done
      t.integer :position
      t.integer :project_id
      t.date :date
      
      t.timestamps
    end
  end
end
