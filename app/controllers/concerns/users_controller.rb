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

    @user.book_ids = params[:user][:book_ids]

    @user.user_books.each do |user_book|
      #sets each book to not favorite
      user_book.favorite = false

      # update books marked for favorite
      params[:user][:user_books].each do |user_book_id|
# binding.pry
        if user_book.id == user_book_id
binding.pry
          user_book.favorite = true
        end
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
    @user = User.largest_bookshelf
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted."
    redirect_to users_path
  end

  def favorite
binding.pry
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :book_ids)
  end
end
