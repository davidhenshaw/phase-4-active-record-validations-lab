class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :clickbait?

    def clickbait?
        patterns = [/Won't Believe/i]
        if patterns.none?{|pattern| pattern.match(title) }
            errors.add(:title, "Not clickbait-y enough!")
        end
    end
end
