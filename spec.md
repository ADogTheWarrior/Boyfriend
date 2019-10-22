# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project (The project was created in Rails)
- [x] Include at least one has_many relationship (Authors has many Books)
- [x] Include at least one belongs_to relationship (Books belongs to Authors)
- [x] Include at least one has_many through relationship (User has many Authors through Books)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (User_book.favorite)
- [x] Include reasonable validations for simple model objects (Models User/Author/Book)
- [x] Include a class level ActiveRecord scope method (View User Largest Bookshelf)
- [x] Include signup (omniauth-google-oauth2)
- [x] Include login (omniauth-google-oauth2)
- [x] Include logout (omniauth-google-oauth2)
- [x] Include third party signup/login (omniauth-google-oauth2)
- [x] Include nested resource show or index (authors/:id/books)
- [x] Include nested resource "new" form (authors/:id/books/new)
- [x] Include form display of validation errors (View Book Edit)

Confirm:
- [x] The application is pretty DRY (I've gone through and I don't feel like things have been repeated)
- [x] Limited logic in controllers (everything in the controller is just what's needed)
- [x] Views use helper methods if appropriate (User.largest_bookshelf?)
- [x] Views use partials if appropriate (Added partials where I could to make it DRY)
