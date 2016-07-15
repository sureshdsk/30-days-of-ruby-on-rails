class BooksController < ApplicationController

	def new
		@book = Book.new
  	end

  	def index
  		@books = Book.all
  	end
  
  	def create
  		@book = Book.new(allow_params)
  		if @book.save
  			redirect_to @book
  		else
  			render 'new'
  		end
	end

	def show
		@book = Book.find(params[:id])
	end

	private
	def allow_params
		params.require(:book).permit(:title, :description, :author)
	end

end
