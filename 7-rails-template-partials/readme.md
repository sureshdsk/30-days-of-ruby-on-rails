## Day 7 - Rails - Template Partials

As of now, Both create new form and edit form templates are using same form with a slight variation, that is one with post method and one with patch method. We can use template partials to avoid duplication of code and re-use templates. Rails can infer whether to use post method or patch method, which makes our life easier.


### Create _form.html.erb and use render method to generate forms

```
#app/views/pages/_form.html.erb
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

<%= form_for @book do |f| %>
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
#app/views/pages/new.html.erb

<h1>Add New Book</h1>

<%= render 'form' %>

<%= link_to 'Back', books_path %>
```


```
#app/views/pages/edit.html.erb

<h1>Edit A Book</h1>

<%= render 'form' %>

<%= link_to 'Back', books_path %>
```

