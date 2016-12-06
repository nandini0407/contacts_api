class ContactsController < ApplicationController

  # def index
  #   @contacts = Contact.all
  #   render json: @contacts
  # end

  def index
    u = User.find(params[:user_id])
    render json: u.contacts
    # render json: u.shared_contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    render json: @contact.destroy
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
