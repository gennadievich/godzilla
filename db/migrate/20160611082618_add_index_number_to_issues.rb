class AddIndexNumberToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :index_number, :integer
  end
end
