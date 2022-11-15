class Idea < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :user, optional: true

    has_many :likes, dependent: :destroy
    validates :body, presence: true
    
    def is_valid?
        title.present? &&body.present?
    end
end
