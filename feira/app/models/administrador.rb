# Class representing an Administrator in the system.
# Inherits from ApplicationRecord and includes secure password functionality.
class Administrador < ApplicationRecord
    has_secure_password
end
