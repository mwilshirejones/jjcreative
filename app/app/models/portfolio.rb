class Portfolio < ApplicationRecord
  has_many :projects

  before_save :set_default_nav_title

  validates :title, presence: true

  def project_list
    projects.map do |x|
      {
        title: x.title,
        short_description: x.short_description
      }
    end
  end

  private

  def set_default_nav_title
    self.nav_title ||= title
  end
end
