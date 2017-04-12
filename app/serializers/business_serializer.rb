class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :website
  has_many :trucks
end
