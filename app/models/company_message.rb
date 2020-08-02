class CompanyMessage < ApplicationRecord
  belongs_to :company
  belongs_to :room
  has_many :notifications, dependent: :destroy
  validates :message, presence: true

  def c_create_notification_message(current_company, company_message_id, visited_id)
    notification = current_company.active_notifications.new(
      room_id: self.id,
      company_message_id: company_message_id,
      visited_id: company_id,
      action: "message"
    )
    # 自分のメッセージを自分に通知する必要はないため、自分のRoomに対するメッセージの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end