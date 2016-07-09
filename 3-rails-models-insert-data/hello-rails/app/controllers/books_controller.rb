class BooksController < ApplicationController

	def new
  	end

  	def index
  		@books = Book.all
  	end
  
  	def create
  		@book = Book.new(allow_params)
  		@book.save
  		redirect_to @book
	end

	def show
		@book = Book.find(params[:id])
	end

	private
	def allow_params
		params.require(:book).permit(:title, :description, :author)
	end

end
