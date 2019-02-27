module V2
  class ContactSerializer < ActiveModel::Serializer
    attributes %i[id name email birthdate]

    link(:self) { v2_contact_url object }

    def attributes(*args)
      h = super(*args)
      h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
      h
    end
  end
end