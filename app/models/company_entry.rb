class CompanyEntry < ApplicationRecord
  belongs_to :company
  belongs_to :room
end
