class Notification < ApplicationRecord
  #スコープ(新着順)
  default_scope->{order(created_at: :desc)}

  belongs_to :user, optional: true
  belongs_to :company, optional: true
  belongs_to :room
end