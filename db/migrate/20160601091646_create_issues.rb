class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :summary
      t.string :description
      t.integer :estimate_time
      t.integer :reporter_id
      t.integer :status_id
      t.integer :priority_id
      t.integer :type_id
      t.integer :sprint_id

      t.timestamps
    end
  end
end
