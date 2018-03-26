class StillsProject < Project
  # TODO: Don't like the name of this join table...change?
  has_many :stills_project_images
  has_many :images, through: :stills_project_images
end
