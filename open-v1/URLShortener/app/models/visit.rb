class Visit < ApplicationRecord
    validates :user_id, :shortened_url_id, presence: true

    belongs_to :visitor,
        class_name: 'User',
        primary_key: :id,
        foreign_key: :user_id

    belongs_to :shortened_url

    def self.record_visit!(user, shortened_url)
        Visit.create!(user_id: user.id, shortened_url_id: shortened_url.id)    
    end
end
