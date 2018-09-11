class User < ActiveRecord::Base
  has_many :books
  has_many :authors, through: :books
  has_secure_password

  #return the most common author
  #ties return the newest? or oldest?
  def favorite_author
    return "activerecord of favorite author"
  end
end
