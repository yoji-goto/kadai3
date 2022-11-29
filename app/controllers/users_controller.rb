class UsersController < ApplicationController
  def show
    @a = User.find(params[:id])
    @books = @a.books
    @user = current_user
    @book = Book.new
  end

  def edit
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
end
