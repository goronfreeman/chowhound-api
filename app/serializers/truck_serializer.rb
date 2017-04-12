class TruckSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :business
end
