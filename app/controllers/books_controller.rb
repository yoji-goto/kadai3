class BooksController < ApplicationController

  def create
  @book = Book.new(books_params)
  @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "新規投稿が成功しました。"
    redirect_to books_path
    else
    @book = Book.new
    @books = Book.all
    @user = current_user
    render :index
    end
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.new
    @user = current_user
    @show = Book.find(params[:id])

  end

  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
  end

  def update
    is_matching_login_user
    book = Book.find(params[:id])
    if book.update(books_params)
    flash[:notice] = "投稿の更新が成功しました。"
    redirect_to book_path(book.id)
    else
    book = Book.find(params[:id])
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end

end
