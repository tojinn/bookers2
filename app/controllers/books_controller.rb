class BooksController < ApplicationController
    
    def new
     @book = Book.new
    end
    
    def index
      @books = Book.all
      @book = Book.new
      @user = current_user
    end
    
    def create
     @books = Book.all
     @book = Book.new
     @user = current_user
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
       redirect_to book_path(@book.id), notice: "You have created book successfully."
     else
       render :index
     end
    end
    
    def show
     @books = Book.all
     @book = Book.new
     @user = current_user
    end
    
    def edit
     @book = Book.find(params[:id])
     if @book.user == current_user
      render "edit"
     else
     redirect_to books_path
     end
    end
    
    def update
     @book = Book.find(params[:id])
     if @book.user != current_user
      redirect_to book_path(book)
     else
     if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have update book successfully."
     else 
      flash[:notice] = "errors"
      render :edit
     end
     end
    end
    
    def destroy
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to books_path
    end
end
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end