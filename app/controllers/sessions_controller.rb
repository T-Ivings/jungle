class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct
    if user && user.authenticate(params[:password])
      #Save the user id inside the browser cookie. Keeps user logged in around site
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def new
    
  end

  def destroy 
  session[:user_id] = nil
  redirect_to '/login' 
  end

end
