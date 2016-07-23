class BooksController < ApplicationController
  ADMIN_USERS = { "ror_admin" => "secretpass" }
  
  before_action :authenticate , only: [:new, :edit, :create, :destroy]

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

  def authenticate
    authenticate_or_request_with_http_digest do |user_name|
      ADMIN_USERS[user_name]
    end
  end

end
