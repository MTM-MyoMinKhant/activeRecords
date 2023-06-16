class Author < ApplicationRecord
    has_many :books, dependent: :destroy

    validates :name, presence: true, length: {minimum: 5 , message: "must have at least 10 words"}, uniqueness: true
end
