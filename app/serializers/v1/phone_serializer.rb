module V1
    class PhoneSerializer < ActiveModel::Serializer
    attributes %i[id number]
    belongs_to :contact
  end
end