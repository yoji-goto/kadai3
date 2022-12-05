class BooksController < ApplicationController

  def create
  @book = Book.new(book_params)
  @book.user = current_user
    if @book.save
    flash[:notice] = "新規投稿successfully"
    redirect_to book_path(@book.id)
    else
    @book = Book.new
    @books = Book.all
    @user = current_user
    render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = current_user
    @show = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
     flash[:notice] = "投稿更新successfully"
     redirect_to book_path(book.id)
    else
     book = Book.find(params[:id])
     render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

end
