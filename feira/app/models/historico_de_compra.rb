class HistoricoDeCompra < ApplicationRecord
  belongs_to :user
  belongs_to :produto
end
