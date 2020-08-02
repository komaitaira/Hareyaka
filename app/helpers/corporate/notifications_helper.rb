module Corporate::NotificationsHelper
  def company_unchecked_notifications
    @notifications = current_company.passive_notifications.where(checked: false)
  end
end