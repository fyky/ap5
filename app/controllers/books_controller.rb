class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @commentuser = current_user
    @book_comment = BookComment.new
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
    if @book.save
      flash[:notice]="You have creatad book successfully."
      redirect_to book_path(@book)
    else
      render "index"
    end
  end

  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path, notice: 'Book was successfully created.'
    else
    render "edit"
    end
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
    if @book.user == current_user
      render "edit"
    else
     redirect_to books_path
    end
  end


  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to books_path
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
