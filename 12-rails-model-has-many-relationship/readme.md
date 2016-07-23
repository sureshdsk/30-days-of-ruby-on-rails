## Day 12 - Rails - Model - has_many relationship

### Generating Comment Model
```
bin/rails generate model Comment commenter:string message:text book:references

bin/rails db:migrate
```

### Setting up Book & Comment Model

```ruby
# app/models/book.rb 
class Book < ApplicationRecord
	has_many :comments
	validates :title, :description, :author, presence: true
end

```

```ruby
# app/models/comment.rb 
class Comment < ApplicationRecord
  belongs_to :book
  validates :commenter, :message, presence: true
end

```

### Adding a Route for Comments
```ruby
# config/routes.rb
Rails.application.routes.draw do
	
	resources :books do
		resources :comments
	end

	root to: 'pages#home'
end


```

### Create controller for Comments
```
bin/rails generate controller Comments
```
```ruby
# app/controllers/comments_controller.rb 
class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(comment_params)
    redirect_to book_path(@book)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :message)
    end

end

```

### Create Templates for Comments
app/views/comments/_form.html.erb
```
<%= form_for([@book, @book.comments.build]) do |cf| %>

  <p>
    <%= cf.label :commenter %><br>
    <%= cf.text_field :commenter %>
  </p>
  <p>
    <%= cf.label :message %><br>
    <%= cf.text_area :message %>
  </p>
  <p>
    <%= cf.submit %>
  </p>
<% end %>

```
app/views/comments/_comment.html.erb
```
<p>
<strong>Commenter:</strong>
<%= comment.commenter %>
</p>

<p>
<strong>Comment:</strong>
<%= comment.message %>
</p>

```
app/views/comments/_empty.html.erb
```
<p>Be the first to comment!</p>

```

### Add comment form to Book page

app/views/books/show.html.erb
```
<div class="col-xs-12 col-sm-6 col-sm-offset-3">
<div class="panel panel-default">
  <div class="panel-body">
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

<p>
  <strong>Rating:</strong>
  <%= @book.rating %>
</p>

<h2>Comments</h2>
<% if @book.comments.count > 0 %>
<%= render @book.comments %>
<% else %>
<%= render "comments/empty" %>
<% end %>

<h2>Add a comment:</h2>
<%= render "comments/form"%>

</div>
</div>

</div>
```
