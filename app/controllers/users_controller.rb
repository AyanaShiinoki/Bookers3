class UsersController < ApplicationController

	before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def index
  end

  def edit
  	@user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	redirect_to books_path
    else
      render 'edit'
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name,:profile_image,:introduction)
  end


end
