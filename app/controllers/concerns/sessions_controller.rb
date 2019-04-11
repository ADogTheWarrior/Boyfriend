class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # request is an object i can look at in pry
    # raise request.env["omniauth.auth"].to_yaml
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
# binding.pry
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
    # return head(:forbidden) unless @user.authenticate(params[:password])

    session[:user_id] = @user.id

    render 'users/index'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

private

  def auth
    request.env['omniauth.auth']
    #request env omniauth
    #  raise request.env["omniauth.auth"].to_yaml
    #private method
  end
end
