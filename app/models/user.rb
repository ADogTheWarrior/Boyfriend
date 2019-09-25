class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, :through => :user_books
  has_many :authors, through: :books
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  #returns the User with the biggest bookshelf
  def self.largest_bookshelf
    User.left_joins(:books).group(:id).order('count(books.id) desc').limit(1).first
  end
end
