class Category < ApplicationRecord
	has_many :book_category_relations
	has_many :books, through: :book_category_relations
end
