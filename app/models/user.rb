class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, :through => :user_books
  has_many :authors, through: :books
  has_secure_password

  # validates :provider Just not sure how best to validate right now
  # validates :uid      Just not sure how best to validate right now
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  #return the most common author
  #ties return the newest? or oldest?
  def self.largest_bookshelf
    # binding.pry
    User.left_joins(:books).group('books.id').order('count(books.id) desc').limit(1).first
  end
end
