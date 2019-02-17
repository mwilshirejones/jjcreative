class AddNavTitleToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :nav_title, :string
  end
end
