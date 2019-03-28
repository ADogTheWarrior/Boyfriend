class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    # request is an object i can look at in pry
    # raise request.env["omniauth.auth"].to_yaml
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
# binding.pry
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id

    render 'users/index'
  end

  def edit
  end

  def update
  end

  def destroy
    # Log out method here.
    session.delete :user_id
  end

private

  def auth
    request.env['omniauth.auth']
    #request env omniauth
    #  raise request.env["omniauth.auth"].to_yaml
    #private method
  end
end


# class SessionsController < ApplicationController
#   def create
#     @user = User.find_or_create_by(uid: auth['uid']) do |u|
#       u.name = auth['info']['name']
#       u.email = auth['info']['email']
#       u.image = auth['info']['image']
#     end
#
#     session[:user_id] = @user.id
#
#     render 'welcome/home'
#   end
#
#   private
#
#   def auth
#     request.env['omniauth.auth']
#   end
# end
