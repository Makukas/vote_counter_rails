class Vote < ApplicationRecord
    validates :question, presence: true, length: {maximum: 255}
    validates :answer1, presence: true, length: {maximum: 255}
    validates :answer2, presence: true, length: {maximum: 255}


    def self.getRandomQuestion()
        @minNumber = Vote.pluck(:id).first
        @maxNumber = Vote.pluck(:id).last
        rand(@minNumber..@maxNumber)
    end
end
