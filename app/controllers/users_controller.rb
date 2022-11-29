class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  end

  def index
    @user = User.find(params[:id])
    @books =  @user.books
  end
end
