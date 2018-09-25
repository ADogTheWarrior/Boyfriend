class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, :through => :user_books
  has_many :authors, through: :books

  #return the most common author
  #ties return the newest? or oldest?
  def favorite_author
    return "activerecord of favorite author"
  end
end
