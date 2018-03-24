class Portfolio < ApplicationRecord
  has_many :projects

  before_save :set_default_nav_title

  after_commit :generate_static_page

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

  def generate_static_page
    StaticPageService.new.generate_portfolio(title.parameterize)
  end

  def set_default_nav_title
    self.nav_title = title if nav_title.blank?
  end
end
