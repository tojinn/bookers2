class UsersController < ApplicationController
  def show
   @users = User.all
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books
  end
  
  def index
   @users = User.all
   @book = Book.new
   @user = User.find(params[:id])
   @books = @user.books
  end
  
  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     redirect_to '/users'
  end
  
  def edit
  end
end

private
 def book_params
  params.require(:book).permit(:title, :body)
 end
    