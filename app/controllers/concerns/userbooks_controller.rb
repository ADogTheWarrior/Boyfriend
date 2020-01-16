class UserbooksController < ApplicationController
  def favorite
    @user_book = UserBook.find(params[:id])

    # @user_book switch from false to true or true to false
    if @user_book.favorite == false
      @user_book.favorite = true
    else
      @user_book.favorite = false
    end
    @user_book.save

    @user = User.find(@user_book.user_id)
    redirect_to @user
  end

  private

  def userbook_params
    params.require(:userbook).permit(:favorite)
  end
end
