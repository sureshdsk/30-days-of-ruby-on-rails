## Day 2 - Display "Hello Rails!" on Home page


### Create Controller
```
rails generate controller pages

```

## Setup Route for home page
Route root page to "pages#home"

```
#config/routes.rb
root to: 'pages#home'
```

## Create Controller for home page
```
#app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def home
    @message = "Hello Rails!"
  end
end

```
## Create Template for home page
```
#app/views/pages/home.html.erb
<h1><%= @message %></h1>
```

## Create About Page

## Setup Route for about page
Route /about page to "pages#about"

```
#config/routes.rb
get "/about" => "pages#about"
```

## Create Controller for about page
```
#app/controllers/pages_controller.rb
def about
	@message = "This is Hello Rails App!"
end

```
## Create Template for about page
```
#app/views/pages/about.html.erb
<h1><%= @message %></h1>
```

#### Run the project
```
bin/rails server
```

visit http://localhost:3000/ to check home page and http://localhost:3000/about to check about page