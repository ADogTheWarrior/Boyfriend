class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if (auth[:provider] == "google_oauth2")
      @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
        u.name = auth[:info][:first_name]
        u.email = auth[:info][:email]
        u.password = SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.find_by(email: params[:email])
      # If @user exist and the password is good
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to '/'
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

private

  def auth
    request.env['omniauth.auth']
  end
end
