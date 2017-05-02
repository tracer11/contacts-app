class ContactsController < ApplicationController
  def person
    @contact = Contact.first
    render 'contact.html.erb'
  end

  def all
    @people = Contact.all 
    render 'all_contacts.html.erb'
  end
end
