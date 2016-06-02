class AddFieldsToIssue < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :project_id, :integer
    add_column :issues, :due_date, :date
  end
end
