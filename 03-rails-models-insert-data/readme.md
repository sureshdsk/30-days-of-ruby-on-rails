## Day 3 - Models - Insert & Display data



# Create Model for Books

Book Model contains 3 fields, title, description, author. 

```
bin/rails generate model Book title:string description:text author:string

bin/rails db:migrate
```


### Create Controller for Books
```
bin/rails generate controller Books

```

#### Setup  Route for books
resources - maps all rest endpoints
```ruby
# config/routes.rb

Rails.application.routes.draw do
  resources :books
end

```

#### books controller

```ruby
# app/controllers/books_controller.rb 
class BooksController < ApplicationController
  
  # renders app/views/books/new.html.erb that displays form to insert new book
  def new
  end
  
  # renders app/views/books/index.html.erb that displays all books
  def index
    @books = Book.all
  end
  
  # receive form post data & saves it to books model
  def create
    # allow_params specifies which can be written
    @book = Book.new(allow_params)
    @book.save
    redirect_to @book
  end
  
  # Displays a book by its id
  def show
    @book = Book.find(params[:id])
  end

  private
  def allow_params
    params.require(:book).permit(:title, :description, :author)
  end

end
```


## Templates

```
#app/views/pages/new.html.erb

<h1>Add New Book</h1>

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

```
#app/views/pages/show.html.erb
<h1>Book</h1>
<p>
  <strong>Title:</strong>
  <%= @book.title %>
</p>
 
<p>
  <strong>Description:</strong>
  <%= @book.description %>
</p>

<p>
  <strong>Author:</strong>
  <%= @book.author %>
</p>

````

```
#app/views/pages/index.html.erb
<h1>Listing Books</h1>
 
<table>
  <tr>
    <th>Title</th>
    <th>Author</th>
  </tr>
 
  <% @books.each do |book| %>
    <tr>
      <td><%= book.title %></td>
      <td><%= book.description %></td>
      <td><%= book.author %></td>
      <td><%= link_to 'Show', book_path(book) %></td>
    </tr>
  <% end %>
</table>

```

