class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by_email params[:email]
      if user&.authenticate(params[:password])
        # The session is an object useable in
        # controllers that uses cookies to store
        # encrypted data.
        #To sign a user in, we store their 'user_id'
        # in the session for later retrieval.
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in"
      else
        flash[:alert] = "Email or password is incorrect"
        render :new
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out"
    end
end
