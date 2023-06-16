class Book < ApplicationRecord
    belongs_to :author
  
    validates :name, presence: true, length: { minimum: 5, message: "must have at least 10 words" }
    validates :volume, presence: true, numericality: { only_integer: true, message: "must be a number" }
    validates :price, presence: true, numericality: { message: "must be a number" }
  end
