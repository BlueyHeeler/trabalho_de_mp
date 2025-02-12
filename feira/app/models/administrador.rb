# Class representing an Administrator in the system.
# Inherits from ApplicationRecord and includes secure password functionality.
class Administrador < ApplicationRecord
    has_secure_password

    validates :email, presence: true, 
        format: { with: /@/, message: "deve incluir um '@'" }
end
