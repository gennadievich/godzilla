class CreateProjectTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :project_types do |t|
      t.string :name
      t.string :icon_path
      t.integer :display_order
    end
  end
end
