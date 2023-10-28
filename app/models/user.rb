class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates_format_of :email_id, with: /\A([A-Za-z0-9_.-]+)@((gmail|hotmail|yahoo|outlook)+(.com))\z/i, message: "Please use Gmail, Yahoo, Hotmail or Outlook to register", on: :create
end
