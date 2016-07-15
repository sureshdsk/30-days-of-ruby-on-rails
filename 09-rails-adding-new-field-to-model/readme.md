## Day 9 - Rails - Adding new attribute to model

Lets add a new column "rating" to the book model, 

```
bin/rails generate migration add_rating_to_book rating:integer
```

It follows a pattern, bin/rails generate migration add_COLUMN_NAME_to_MODEL_NAME COLUMN_NAME:COLUMN_DATA_TYPE

Then complete by migrating new field to database.

```
bin/rails db:migrate
```

#### Adding this new field to form as number field
app/views/books/_form.html.erb
```
<% if @book.errors.any? %>
<div class="alert alert-danger" role="alert">
  <p><%= pluralize(@book.errors.count, "error") %> prohibited this book from being saved:</p>
  <ul>
    <% @book.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
  </ul>
</div>
<% end %>

<%= form_for @book do |f| %>
<div class="form-group space-bottom">
<%= f.label :title, "Title:", class: "control-label" %>

  <%= f.text_field :title, class: "form-control" %>

</div>

<div class="form-group space-bottom">
<%= f.label :description, "Description:", class: "control-label" %>

  <%= f.text_area :description, class: "form-control" %>

</div>

<div class="form-group space-bottom">
<%= f.label :author, "Author:", class: "control-label" %>

  <%= f.text_field :author, class: "form-control" %>

</div>

<div class="form-group space-bottom">
<%= f.label :rating, "Rating:", class: "control-label" %>

  <%= f.number_field :rating, in: 1..10, step: 1, class: "control-label"  %>

</div>

<div class="form-group space-bottom">
  <%= f.submit "Create", class: "btn btn-default btn-primary" %> <%= link_to 'Cancel', books_path, class: "btn btn-default" %>

<% end %>

```

#### Display the rating 
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
</div></div>

</div>

```


