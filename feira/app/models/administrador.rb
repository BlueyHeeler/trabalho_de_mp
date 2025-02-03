# Class representing an Administrator in the system.
# Inherits from ApplicationRecord and includes secure password functionality.
# @attr_accessor :password [String] virtual attribute for the user's password
# @attr_accessor :password_confirmation [String] virtual attribute for password confirmation
# @attr_reader :password_digest [String] encrypted password stored in database
class Administrador < ApplicationRecord
    has_secure_password
end
