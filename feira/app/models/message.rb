# The Message model represents a message between a user and a feirante within the system.
#
# @attr user [User] The user that sent/received the message
# @attr feirante [Feirante] The feirante that sent/received the message
#
# Relations:
# - Belongs to a User
# - Belongs to a Feirante
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :feirante
end
