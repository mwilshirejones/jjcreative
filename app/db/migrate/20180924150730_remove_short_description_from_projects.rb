class RemoveShortDescriptionFromProjects < ActiveRecord::Migration[5.1]
  def change
    # Tell safe migrations that this "unsafe" method is safe
    safety_assured { remove_column :projects, :short_description }
  end
end
