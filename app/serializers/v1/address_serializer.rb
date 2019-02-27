module V1
  class AddressSerializer < ActiveModel::Serializer
    attributes %i[id street city]
    belongs_to :contact
  end
end
