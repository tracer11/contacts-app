class ContactsController < ApplicationController
  def index
    @contacts = Contact.all

    if current_user
      user = User.find(current_user.id)
      @contacts = user.contacts
    else
      @contacts = "Welcome"
    end

  end

  def new
  end

  def create
    contact = Contact.new(first_name: params[:first_name],
                          last_name: params[:last_name],
                          middle_name: params[:middle_name],
                          email: params[:email],
                          phone_number: params[:phone_number],
                          bio: params[:bio],
                          user_id: current_user.id
                          )
    contact.save
    redirect_to"/contacts/#{contact.id}"
  end

  def show
    if current_user
      user = User.find(current_user.id)
      @contact = user.contacts
    else
      @contact = "Welcome"
    end

    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    contact.assign_attributes(first_name: params[:first_name],
                          last_name: params[:last_name],
                          middle_name: params[:middle_name],
                          email: params[:email],
                          phone_number: params[:phone_number],
                          bio: params[:bio]
                          )
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
  end
end
