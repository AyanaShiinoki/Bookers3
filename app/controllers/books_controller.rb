class BooksController < ApplicationController
  def new
  end

  def create
  	@book=Book.new(book_params)
  	@book.user_id=current_user.id
  	@book.save
  	redirect_to books_path
  end

  def index
  	@book=Book.new
  	@books=Book.page(params[:page]).reverse_order
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
    @post_comment = PostComment.new
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
        redirect_to book_path(@book.id)
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

	private
	def book_params
		params.require(:book).permit(:title,:body, category_ids: [])
	end



end
