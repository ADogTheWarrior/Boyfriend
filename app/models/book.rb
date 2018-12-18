class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, :through => :user_books
  belongs_to :author

  validates :title, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :pages, presence: true
  # validates :author_id, presence: true
    # Feel like having an author_id validation could conflict later depending on whether the author or the book is created first
end
