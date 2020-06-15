class Post < ApplicationRecord
    has_many :comments
    belongs_to :user

    validates :title, presence: true
    validates :title, length: {maximum: 50}
    validates :content, length: {in: 20..2000}
    validates :content, presence: true
    validates_associated :user

    def preview 
        preview_length = 150
        if content.length < preview_length 
            content
        else 
            content[0..preview_length]
        end
    end
end
