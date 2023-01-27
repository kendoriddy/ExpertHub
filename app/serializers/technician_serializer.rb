class TechnicianSerializer < ActiveModel::Serializer
  attributes :id, :location, :charges, :specialization, :image

  has_many :appointments
end
