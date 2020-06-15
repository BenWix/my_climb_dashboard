class Post < ApplicationRecord
    has_many :comments
    belongs_to :user

    validates :title, presence: true
    validates :title, length: {maximum: 50}
    validates :content, length: {in: 20..2000}
    validates :content, presence: true
    validates_associated :user
end
