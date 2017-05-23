class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = 'Welcome Back #{user.name}!'
      redirect_to'/'
    else
      flash[:warning] = 'Inavlid email or password'
      redirect_to'/login'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = 'Log out successful'
    redirect_to'/login'
  end
end

