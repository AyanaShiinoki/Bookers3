class Book < ApplicationRecord
	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :book_category_relations
	has_many :categories, through: :book_category_relations


end
