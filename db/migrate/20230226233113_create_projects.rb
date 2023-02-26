class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false, limit: 50
      t.integer :status, default: 0, null: false
      t.text :description, limit: 2000
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
