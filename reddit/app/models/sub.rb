class Sub < ApplicationRecord
    validates :description, :name, presence: true
    validates :name, uniqueness: true

    belongs_to :moderator,
        class_name: :User,
        foreign_key: :moderator_id,
        primary_key: :id,
        inverse_of: :subs
end
