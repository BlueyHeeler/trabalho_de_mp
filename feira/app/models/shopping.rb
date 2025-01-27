class Shopping < ApplicationRecord
  has_many :feirantes, dependent: :destroy
  end
