class Author < ActiveRecord::Base
  has_many :books
  has_many :users, through: :books
  accepts_nested_attributes_for :books

  validates :name, presence: true, uniqueness: true

  def book_ids=(ids)
    ids.each do |id|
      book = Book.find(id)
      self.books << book
    end
  end

    #find the most common genre from the author's books and return it
    #ties decided by newest? or oldest?
  def most_popular_genre
    return "genre"
  end
end
