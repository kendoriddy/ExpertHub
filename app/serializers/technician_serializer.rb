class TechnicianSerializer < ActiveModel::Serializer
  attributes :id, :location, :charges, :specialization, :image
end
