class Truck < ApplicationRecord
  belongs_to :business

  validates :name, :description, presence: true
end
