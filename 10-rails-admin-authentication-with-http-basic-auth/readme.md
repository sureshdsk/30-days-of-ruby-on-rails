## Day 10 - Rails - Admin authentication with HTTP Basic Auth

Lets prevent guest users from creating new books, edit or delete existing book with http basic authentication. We must login with username "ror_admin" and password "secretpass" to create, edit or delete books.  

app/controllers/books_controller.rb 
```
class BooksController < ApplicationController
  
  #new, edit, create and destroy methods are protected by basic auth
  http_basic_authenticate_with name: "ror_admin", password: "secretpass", only: [:new, :edit, :create, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(allow_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
   
    if @book.update(allow_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
   
    redirect_to books_path
  end
  
  private
  def allow_params
    params.require(:book).permit(:title, :description, :author, :rating)
  end

end

```

