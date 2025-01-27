class Mensagem < ApplicationRecord
  belongs_to :usuario
  belongs_to :feirante
end
