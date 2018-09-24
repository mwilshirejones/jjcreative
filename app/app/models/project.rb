class Project < ApplicationRecord
  belongs_to :portfolio, optional: true

  validates :title, presence: true
  validates :type, presence: true

  before_save :set_default_short_description,
              :set_default_slug
  after_save :generate_static_page
  before_destroy :delete_static_page

  private

  def generate_static_page
    return if portfolio.nil?

    StaticPageService.new.generate_project(
      portfolio.nav_title,
      slug,
      # Should I be create a copy of self to pass here to the cell?
      ProjectFrontEndCell.new(self).call
    )
  end

  def delete_static_page
    return if portfolio.nil?

    StaticPageService.new.delete_project(
      portfolio.nav_title,
      slug
    )
  end

  def set_default_short_description
    self.short_description = description if short_description.blank?
  end

  def set_default_slug
    slug = title if slug.blank?
    self.slug = slug.parameterize
  end
end
