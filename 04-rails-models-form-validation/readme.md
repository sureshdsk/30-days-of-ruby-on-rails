## Day 4 - Models - Form validation

#### add validation in books model

```ruby
# app/models/book.rb 
class Book < ApplicationRecord
  validates :title, :description, :author, presence: true
end

```


#### let books controller to re-render form when validation error occurs

```ruby
# modify new & create methods on app/controllers/books_controller.rb 
def new
  # Used to pass error objects
  @book = Book.new
end

def create
  @book = Book.new(allow_params)

  # If saved redirect to book index, else render 'new' form
  if @book.save
    redirect_to @book
  else
    render 'new'
  end
end
```


## Display Error Message on Page

```
#app/views/pages/new.html.erb

<h1>Add New Book</h1>

<% if @book.errors.any? %>
    <div class="error">
      <h2>
        <%= pluralize(@book.errors.count, "error") %> prohibited this book from being saved:
      </h2>
      <ul>
        <% @book.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
      </ul>
    </div>
<% end %>

<%= form_for :book, url: books_path do |f| %>
  <p>
  <%= f.label :title %><br>
  <%= f.text_field :title %>
  </p>

  <p>
  <%= f.label :description %><br>
  <%= f.text_area :description %>
  </p>

  <p>
  <%= f.label :author %><br>
  <%= f.text_field :author %>
  </p>

  <p>
  <%= f.submit %>
  </p>
<% end %>

```

