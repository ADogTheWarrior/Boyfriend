class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
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

    # deletes all books with this user
    @user.books.clear

    # adds books from params
    params[:user][:book_ids].each do |book_id|
      if (book_id != "")
        book = Book.find(book_id)
        @user.books << book
      end
    end

    @user.update(user_params)

    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def largest_bookshelf
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :book_ids)
  end
end
