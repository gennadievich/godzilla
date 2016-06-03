class AddIssueTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :issue_types do |t|
      t.string :name
      t.string :icon_path
      t.integer :display_order

      t.timestamps
    end
  end
end
