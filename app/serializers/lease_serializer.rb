class LeaseSerializer < ActiveModel::Serializer
  attributes :id
  has_one :apartment
  has_one :tenant
end
