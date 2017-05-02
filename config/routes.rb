Rails.application.routes.draw do
 get '/contacts' => 'contacts#person'
 get '/all_contacts' => 'contacts#all'
end
