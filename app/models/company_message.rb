class CompanyMessage < ApplicationRecord
  belongs_to :company
  belongs_to :room
  validates :message, presence: true
end
