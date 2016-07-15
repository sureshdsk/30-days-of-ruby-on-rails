## Day 8 - Rails - Twitter Boostrap

### Using Twitter Boostrap front end framework in the Rails App.

### Install bootstrap-sass gem

add 'bootstrap-sass' to Gemfile
```
gem 'bootstrap-sass', '~> 3.3.6'

```

and do "bundle install" and restart the server

rename app/assets/stylesheets/application.css to  app/assets/stylesheets/application.scss ans Import Bootstrap styles.
```
@import "bootstrap-sprockets";
@import "bootstrap";
```

###### app/assets/stylesheets/books.scss
```
@mixin box-shadow($top, $left, $blur, $color, $inset: false) {
  @if $inset {
    -webkit-box-shadow:inset $top $left $blur $color;
    -moz-box-shadow:inset $top $left $blur $color;
    box-shadow:inset $top $left $blur $color;
  } @else {
    -webkit-box-shadow: $top $left $blur $color;
    -moz-box-shadow: $top $left $blur $color;
    box-shadow: $top $left $blur $color;
  }
}

.edit_book {
  
  input[type="text"] {
    display: block;
    padding: 6px 12px;
    text-decoration: none;
    border: 1px solid #ccc;
    border-radius: 4px;

    @include box-shadow(0, 1px, 1px, rgba(0, 0, 0, 0.075),inset);
  }
}
.space-bottom{margin-bottom: 20px;}
```

More info on bootstrap sass - https://github.com/twbs/bootstrap-sass#a-ruby-on-rails



### Using bootstrap style markup on all templates
###### app/views/layouts/application.html.erb
```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HelloRails</title>
    <%= csrf_meta_tags %>

    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <div class="col-xs-12 col-sm-6 col-sm-offset-3">
    <ul class="nav nav-pills">
    <li role="presentation" class="<%= 'active' if current_page?(root_path) %>">
      <a href="/">Home</a>
    </li>
    <li role="presentation" class="<%= 'active' if current_page?(books_path) %>">
      <%= link_to 'All Books', books_path %>
    </li>
    
    <li role="presentation" class="pull-right <%= 'active' if current_page?(new_book_path) %>">
      <%= link_to 'Create New Book', new_book_path %>
    </li>

    </ul>
    </div>

    <div class="clearfix"></div>


    <%= yield %>
  </body>
</html>

```

###### app/views/books/index.html.erb
```
<div class="col-xs-12 col-sm-6 col-sm-offset-3">
<h1>All Books</h1>
 
<table class="table">
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
      <td>
      <%= link_to book_path(book) , class: "btn btn-default", title: "view book", data: {toggle: "tooltip", placement: "bottom"} do %>
        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 
      <% end %>
      </td>
      <td>
      <%= link_to edit_book_path(book) , class: "btn btn-default", title: "edit book", data: {toggle: "tooltip", placement: "bottom"} do%>
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 
      <% end %>
      </td>
      <td>
      <%= link_to book_path(book), class: "btn btn-default", title: "delete book", method: :delete, data: { confirm: 'Are you sure?', toggle: "tooltip", placement: "bottom" } do%>
      <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 
      <% end %>
      </td>
    </tr>
  <% end %>
</table>
</div>

```

###### app/views/books/_form.html.erb
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
  <%= f.submit "Create", class: "btn btn-default btn-primary" %> <%= link_to 'Cancel', books_path, class: "btn btn-default" %>

<% end %>

```


###### app/views/books/new.html.erb
```
<div class="col-xs-12 col-sm-6 col-sm-offset-3">
<h1>Add New Book</h1>

<%= render 'form' %>


</div>
```


##### app/views/books/edit.html.erb
```
<div class="col-xs-12 col-sm-6 col-sm-offset-3">
<h1>Edit A Book</h1>

<%= render 'form' %>

</div>
```

###### app/views/books/show.html.erb
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
</div></div>

</div>
```

#### Enabling boostrap tooltip
###### add bootstrap tooltip snippet to app/assets/javascripts/application.js
```

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

```