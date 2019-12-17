class PostCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		comment = PostComment.new(post_comment_params)
		comment.user_id = current_user.id
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book)
	end

	def destroy
		book = Book.find(params[:book_id])
		post_comment = PostComment.find(params[:id])
		post_comment.destroy
		redirect_to book_path(book.id)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:user_id,:book_id,:comment)
	end

end
