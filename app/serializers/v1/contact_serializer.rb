module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes %i[id name email birthdate]

    belongs_to :kind do
      link(:related) { v1_contact_kind_url object }
    end

    has_many :phones do
      link(:related) { v1_contact_phones_url object }
    end

    has_one :address do
      link(:related) { v1_contact_address_url object }
    end

    link(:self) { v1_contact_url object }

    def attributes(*args)
      h = super(*args)
      h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
      h
    end
  end
end