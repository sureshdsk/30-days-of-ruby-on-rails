## Day 13 - Rails - Activerecord Pagination


### Install will_paginate gem
add 'will_paginate' to Gemfile
```
# Active Record Pagination
gem 'will_paginate', '~> 3.1.0'
```
and do "bundle install" and restart the server


### Use paginate method in controller

```ruby
# app/controllers/books_controller.rb 
def index
  @books = Book.paginate(:page => params[:page], :per_page => 10)
end

```

### Add Pagination markup to corresponding template

app/views/books/index.html.erb
```
<%= will_paginate @books %>

```

