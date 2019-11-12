class UserbooksController < ApplicationController
  def favorite
  binding.pry
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

  private

  def userbook_params
    params.require(:userbook).permit(:favorite)
  end
end
