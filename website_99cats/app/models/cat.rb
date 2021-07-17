require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  CAT_COLORS = ["White", "Black", "Ginger", "Blue", "Grey", "Cream", "Brown", "Cinnamon", "Fawn"].freeze
  
    validates :color, inclusion: CAT_COLORS
    validates :sex, inclusion: %w(M F)
    validates :birth_date, :color, :name, :sex, presence: true

    has_many :rental_requests,
      class_name: :CatRentalRequest,
      dependent: :destroy

    def age        
        time_ago_in_words(birth_date)
    end
end
