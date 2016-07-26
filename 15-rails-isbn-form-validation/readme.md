## Day 15 - Rails - ISBN Form Validation

Lets add a new column "isbn" to the book model,
```
bin/rails generate migration add_isbn_to_book isbn:string
```
do migrate the changes by
```
bin/rails db:migrate
```

To validate the isbn number entered while creating book is a valid isbn format or not. To do this so, we can  use "isbn_validation" gem. Add this to Gem file and install it.

```
gem 'isbn_validation'
```
more info on this gem is [here](https://github.com/zapnap/isbn_validation)

### Enable validation Book model

```
class Book < ApplicationRecord
	has_many :comments
	validates :title, :description, :author, presence: true
	validates :isbn, presence: true
	validates :isbn, :isbn_format => true
end

```
