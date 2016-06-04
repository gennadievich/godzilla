class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :key
      t.integer :type_id
      t.integer :lead_id
      t.integer :category_id
      t.string :url

      t.timestamps
    end
  end
end
