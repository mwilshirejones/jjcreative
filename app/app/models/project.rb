class Project < ApplicationRecord
  belongs_to :portfolio, optional: true
end
