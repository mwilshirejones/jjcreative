class CreateStillsProjectImages < ActiveRecord::Migration[5.1]
  def change
    create_table :stills_project_images do |t|
      t.belongs_to :image, index: true
      t.belongs_to :stills_project, index: true

      t.timestamps
    end
  end
end
