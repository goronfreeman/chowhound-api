class Business < ApplicationRecord
  has_many :trucks, dependent: :destroy

  validates :name, :email, :phone, :website, presence: true
end
