class ContactsController < ApplicationController
  def person
    @contact = Contact.first
    render 'contact.html.erb'
  end
end
