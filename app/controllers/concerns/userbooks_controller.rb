class UserbooksController < ApplicationController
  def favorite
    # current bug, @user_book is undefined
  # binding.pry

      # @user_book switch from false to true or true to false
      if @user_book.favorite == false
        @user_book.favorite = true
      else
        @user_book.favorite = false
      end
      @user_book.save

      # redirect_to user show view
  end

  def index
  end

  def show
    # needs to be able to find the specific userbook, seems like it would need to know the book and user id
    # binding.pry
    # if session.include? :id
      @user_book = UserBook.find(params[:id])

      if @user_book.favorite == false
        @user_book.favorite = true
      else
        @user_book.favorite = false
      end
      @user_book.save

      @user = User.find(@user_book.user_id)
      redirect_to @user
    # else
    #   redirect_to '/'
    # end
  end

  private

  def userbook_params
    params.require(:userbook).permit(:favorite)
  end
end
