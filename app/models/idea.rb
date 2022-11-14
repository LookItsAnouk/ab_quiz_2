class Idea < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :user, optional: true

    has_many :likes, dependent: :destroy
   
end
