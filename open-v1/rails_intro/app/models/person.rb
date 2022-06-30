class Person < ApplicationRecord
    validates :name, :house, presence: true

    belongs_to(
        :house,
        class_name: 'House',
        primary_key: :id,
        foreign_key: :house_id
    )
end
