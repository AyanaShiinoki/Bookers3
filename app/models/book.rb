class Book < ApplicationRecord

	validates :title, presence: true
	validates :body,
	presence: true,
	length: { maximum: 100 }


	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :book_category_relations
	has_many :categories, through: :book_category_relations


end
