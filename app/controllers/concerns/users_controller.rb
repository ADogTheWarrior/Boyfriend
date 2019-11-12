class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
# binding.pry
    if session.include? :user_id
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.book_ids = params[:user][:book_ids]

    @user.update(user_params)

    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def largest_bookshelf
    @user = User.largest_bookshelf
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted."
    redirect_to users_path
  end

  def favorite
# binding.pry
    # @user_book switch from false to true or true to false
    # if @user_book.favorite == false
    #   @user_book.favorite = true
    # else
    #   @user_book.favorite = false
    # end
    # @user_book.save

    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :book_ids)
  end
end
