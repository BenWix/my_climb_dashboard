class Hangboard < ApplicationRecord
    has_many :exercises
    belongs_to :user
    accepts_nested_attributes_for :exercises

    def date=(string_date)
        date_ints = string_date.split("-").map(&:to_i)
        super(DateTime.new(*date_ints))
    end

    def date_display
        self.date.strftime("%m/%d/%Y")
    end
end
