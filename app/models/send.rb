class Send < ApplicationRecord
    belongs_to :user 
    belongs_to :climb
    has_many :send_comments
    has_rich_text :description

    def attempts_display
        if attempts ==  1
            "Flashed"
        else
            "#{attempts} attempts"
        end
    end

end
