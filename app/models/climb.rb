class Climb < ApplicationRecord
    has_many :sends
    has_many :users, through: :sends
end
