class Image < ApplicationRecord
  # TODO: Don't like the name of this join table...change?
  has_many :stills_project_images
  has_many :stills_projects, through: :stills_project_images

  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
