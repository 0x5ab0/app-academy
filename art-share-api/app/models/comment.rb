class Comment < ApplicationRecord
    validates :body, presence: true

    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id
end
