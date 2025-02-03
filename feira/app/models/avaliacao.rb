# Class responsible for managing product evaluations in the system.
# Represents the evaluation/review relationship between users and products.
#
# @attributes:
#   - usuario: The user who made the evaluation
#   - produto: The product being evaluated
#
# @associations:
#   - belongs_to :usuario
#   - belongs_to :produto
class Avaliacao < ApplicationRecord
  belongs_to :usuario
  belongs_to :produto
end
