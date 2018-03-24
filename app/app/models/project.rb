class Project < ApplicationRecord
  belongs_to :portfolio, optional: true

  validates :title, presence: true
  validates :type, presence: true

  before_save :set_default_short_description

  private

  def set_default_short_description
    self.short_description = description if short_description.blank?
  end
end
