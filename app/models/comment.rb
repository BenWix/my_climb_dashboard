class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    validates_associated :user
    validates :content, length: {in: 2..500}
end
