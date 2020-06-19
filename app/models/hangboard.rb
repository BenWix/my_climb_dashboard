class Hangboard < ApplicationRecord
    has_many :exercises
    belongs_to :user
end
