class Author < ActiveRecord::Base
  has_many :books
  has_many :users, through: :books

  #find the most common genre from the author's books and return it
  #ties decided by newest? or oldest?
  def most_popular_genre
    return "genre"
  end
end
