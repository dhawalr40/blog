class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy
    belongs_to :user
    has_many :likes, dependent: :destroy
    # validates :body, presence: true, length: { minimum: 10 }

end
