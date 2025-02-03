class User < ApplicationRecord
    has_secure_password
    has_many :wish_lists

    def coordinates
      return [] unless localizacao
      localizacao.split(",").map(&:to_f)
    end
end
