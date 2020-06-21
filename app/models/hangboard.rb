class Hangboard < ApplicationRecord
    has_many :exercises
    belongs_to :user
    accepts_nested_attributes_for :exercises

    validates :weight , presence: true
    validates_associated :user 
    validates :date, presence: true
    validate :hangboard_not_in_future

    def date=(string_date)
        date_ints = string_date.split("-").map(&:to_i)
        super(DateTime.new(*date_ints))
    end

    def exercises_attributes=(exercises)
        exercises.values.each do |exercise|
            self.exercises.build(exercise)
        end
    end

    def date_display
        self.date.strftime("%m/%d/%Y")
    end

    def hangboard_not_in_future
        if date.present? && date > Date.today
            errors.add(:date, "Can't be in the future")
        end
    end
end
