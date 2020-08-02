class Notification < ApplicationRecord
  #スコープ(新着順)
  default_scope->{order(created_at: :desc)}

  belongs_to :user_message, optional: true
  belongs_to :company_message, optional: true
  belongs_to :u_visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
  belongs_to :u_visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  belongs_to :c_visiter, class_name: 'Company', foreign_key: 'visiter_id', optional: true
  belongs_to :c_visited, class_name: 'Company', foreign_key: 'visited_id', optional: true
end