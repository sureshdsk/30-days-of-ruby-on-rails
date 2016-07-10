## Day 5 - Models - Update Data

#### Controller for Editing a book

```ruby
# add edit & update method on app/controllers/books_controller.rb 
def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:id])
 
  if @book.update(allow_params)
    redirect_to @book
  else
    render 'edit'
  end
end
```


## Edit Page Template


```
#app/views/pages/edit.html.erb

<h1>Edit A Book</h1>

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

<%= form_for :book, url: book_path(@book), method: :patch do |f| %>
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

<%= link_to 'Back', books_path %>

```

### Add Edit link to index page
```
#app/views/pages/index.html.erb
<h1>All Books</h1>
 
<table>
  <tr>
    <th>Title</th>
    <th>Description</th>
    <th>Author</th>
  </tr>
 
  <% @books.each do |book| %>
    <tr>
      <td><%= book.title %></td>
      <td><%= book.description %></td>
      <td><%= book.author %></td>
      <td><%= link_to 'Show', book_path(book) %></td>
      <td><%= link_to 'Edit', edit_book_path(book) %></td>
    </tr>
  <% end %>
</table>
```
