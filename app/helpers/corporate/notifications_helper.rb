module Corporate::NotificationsHelper
  def company_unchecked_notifications
    @notifications = Notification.where(
      receiver_id: current_company.id,
      receiver_class: "company",
      checked: false
    )
  end
end