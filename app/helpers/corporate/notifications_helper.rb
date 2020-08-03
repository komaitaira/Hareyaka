module Corporate::NotificationsHelper
  def company_unchecked_notifications
    @notifications = current_company.notifications.where(checked: true)
  end
end