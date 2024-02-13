class ContactsController < ApplicationController
  before_action :load_contacts, except: [:index, :create]

  def index
    contacts = Contact.all
    contacts = contacts.map{|contact| {id: contact.id, email: contact.email, phone: contact.phone, address: contact.address, customer: contact.customer}}
    render json: {contacts: contacts}
  end

  def show
    render json: @contact
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: {errors: contact.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: {errors: @contact.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @contact.destroy
      render json: {message: "Successfully destroyed contact."}, status: :ok
    else
      render json: {errors: contact.errors}, status: :unprocessable_entity
    end
  end

  private

  def load_contacts
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:email, :phone, :address, :customer_id)
  end
end
