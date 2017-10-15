class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :short_description
      t.boolean :homepage_feature

      t.timestamps
    end
  end
end
