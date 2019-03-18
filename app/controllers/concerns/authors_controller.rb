class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
    @author.books.build
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to author_path(@author)
    else
      render :edit
    end
  end

  def destroy
    Author.find(params[:id]).destroy
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(
      :name,
      book_ids: [],
      books_attributes: [
        :title,
        :genre,
        :pages
      ]
    )
  end
end
