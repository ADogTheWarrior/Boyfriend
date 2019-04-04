class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, :through => :user_books
  belongs_to :author

  validates :title, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :pages, presence: true

  enum genre: [ :Action, :Adventure, :Art, :Autobiography, :Anthology, :Biography, :Book_Review, :Chick_Lit, :Children, :Cookbook, :Comic_Book, :Coming_of_age, :Crime, :Diary, :Dictionary, :Drama, :Encyclopedia, :Fairytale, :Fantasy, :Fiction, :Guide, :Graphic_Novel, :Health, :History,
    :Horror, :Journal, :Math, :Memoir, :Mystery, :New_Age, :Non_Fiction, :Prayer, :Paranormal, :Religious, :Picture_Book, :Poetry, :Political, :Review, :Romance, :Satire, :Science, :Self_Help, :Short_Story, :Suspense, :Textbook, :Thriller, :Travel, :Young_Adult ]

  # validates :author_id, presence: true
    # Feel like having an author_id validation could conflict later depending on whether the author or the book is created first

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
  end

  def author_name
    self.author ? self.author.name : nil
  end

  def author_attributes=(author)
    self.author = Artist.find_or_create_by(name: author.name)
    self.author.update(author)
  end
end
