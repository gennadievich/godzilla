class CreateIssuePriorities < ActiveRecord::Migration[5.0]
  def change
    create_table :issue_priorities do |t|
      t.string :name
      t.string :icon_path
      t.integer :display_order
    end
  end
end
