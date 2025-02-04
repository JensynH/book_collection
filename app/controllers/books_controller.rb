class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy, :confirm_delete]

    def index
      @books = Book.all
    end
  
    def new
      @book = Book.new
    end
  
    def create
      @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "Book successfully created."
        redirect_to books_path
      else
        render :new
      end
    end
  
    def edit
      @book = Book.find(params[:id])
    end
  
    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "Book successfully updated."
        redirect_to books_path
      else
        render :edit
      end
    end
  
    def show
      @book = Book.find(params[:id])
    end
  
    def destroy
      @book = Book.find(params[:id])
      if @book.destroy
        flash[:notice] = "Book successfully deleted."
      else
        flash[:alert] = "Failed to delete the book."
      end
      redirect_to books_path
    end

    def confirm_delete
        # Just renders a confirmation page, no actual deletion happens yet
    end
  
    private
  
    def book_params
      params.require(:book).permit(:title, :author, :price, :published_date)
    end

    def set_book
      @book = Book.find(params[:id])
    end
  end
  