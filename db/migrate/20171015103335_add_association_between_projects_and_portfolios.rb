class AddAssociationBetweenProjectsAndPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :portfolio, index: false
    commit_db_transaction
    add_index :projects, :portfolio_id, algorithm: :concurrently
  end
end
