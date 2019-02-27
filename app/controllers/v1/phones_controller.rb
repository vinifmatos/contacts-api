module V1
  class PhonesController < ApplicationController
    before_action :set_contact

    # GET /phones/1
    def show
      render json: @contact.phones
    end

    # POST /contacts/1/phone
    def create
      @contact.phones << Phone.new(phone_params)
      if @contact.save
        render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
      else
        render json: @contact.erros, status: :unprocessable_entity
      end
    end

    # PATCH /contacts/1/phone
    def update
      phone = Phone.find(phone_params[:id])
      if phone.update(phone_params)
        render json: @contact.phones
      else
        render json: phone.erros, status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1/phone
    def destroy
      phone = Phone.find(phone_params[:id])
      phone.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:contact_id])
      end

      def phone_params
        ActiveModelSerializers::Deserialization.jsonapi_parse params
      end
  end
end