class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


	def after_sign_in_path_for(resource) 
    books_path
	end

before_action :set_search

def set_search
  #@search = Article.search(params[:q])
  @search = Book.ransack(params[:q]) #ransackメソッド推奨
  @search_books = @search.result.page(params[:page])
end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
