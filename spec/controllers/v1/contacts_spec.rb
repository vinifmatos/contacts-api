require 'rails_helper'

class Hash
  def json(parts)
    ary = parts.split('/')
    ary.reduce(self) do |memo, key|
      memo.fetch(key.to_s.strip) if memo
    end
  end
end

describe V1::ContactsController, type: :controller do
  it 'request index without accept header and return 406' do
    get :index
    expect(response).to have_http_status(:not_acceptable)
  end

  it 'request index and return 200 OK' do
    request.accept = 'application/vnd.api+json'
    get :index
    expect(response).to have_http_status(:ok)
  end

  it 'GET /v1/contacts/:id' do
    contact = Contact.first

    request.accept = 'application/vnd.api+json'
    get :show, params: { id: contact.id }

    response_body = JSON.parse(response.body)

    expect(response_body.json('data/id').to_i).to eq(contact.id)
    expect(response_body.json('data/type')).to eq(contact.class.name.downcase.pluralize)
    expect(response_body.json('data/attributes/name')).to eq(contact.name)
  end
end
