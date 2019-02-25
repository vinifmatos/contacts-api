class ContactSerializer < ActiveModel::Serializer
  attributes %i[id name email birthdate]
  belongs_to :kind do
    link(:related) { kind_url object.kind_id }
  end
  has_many :phones
  has_one :address

  link(:self) { contact_url object }

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
