class Message < ApplicationRecord
  MAX_USER_MESSAGES = 5
  belongs_to :chat

  validate :user_message_limit, if: -> { role == "user"}

  def user_message_limit
    if chat.messages.where(role: "user").count >= MAX_USER_MESSAGES
      errors.add(:content, "You can only send #{MAX_USER_MESSAGES} messages per chat.")
    end
  end
end
