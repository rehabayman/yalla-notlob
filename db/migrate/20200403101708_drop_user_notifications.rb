class DropUserNotifications < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_notifications
  end
end
