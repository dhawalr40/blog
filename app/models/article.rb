class Article < ApplicationRecord
    has_many :comments
    
    validates :body, presence: true, length: { minimum: 10 }
end
