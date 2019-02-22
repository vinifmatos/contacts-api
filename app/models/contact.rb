class Contact < ApplicationRecord
  belongs_to :kind

  def as_json(options={})
    super(
      root: true,
      include: { kind: { only: [:id, :description] } }
    )
  end
end
