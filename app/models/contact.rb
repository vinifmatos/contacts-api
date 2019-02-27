class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address
  validates_presence_of :name
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true, allow_destroy: true
  # paginates_per 5
end
