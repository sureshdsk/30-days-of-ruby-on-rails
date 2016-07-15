## Day 6 - Models - Delete Data

#### Controller for Editing a book

```ruby
# add destroy method on app/controllers/books_controller.rb 
def destroy
  @book = Book.find(params[:id])
  @book.destroy
 
  redirect_to books_path
end
```


### Add a link delete a book on index page
```
#app/views/pages/index.html.erb
<h1>All Books</h1>
 
<table>
  <tr>
    <th>Title</th>
    <th>Description</th>
    <th>Author</th>
    <th colspan="3"></th>
  </tr>
 
  <% @books.each do |book| %>
    <tr>
      <td><%= book.title %></td>
      <td><%= book.description %></td>
      <td><%= book.author %></td>
      <td><%= link_to 'Show', book_path(book) %></td>
      <td><%= link_to 'Edit', edit_book_path(book) %></td>
      <td><%= link_to 'Destroy', book_path(book),
              method: :delete,
              data: { confirm: 'Are you sure?' } %></td>
    </tr>
  <% end %>
</table>
```
