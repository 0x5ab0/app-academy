class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, :submitter_id, presence: true
    validates :short_url, uniqueness: true

    def self.random_code
        loop do
            random_code = SecureRandom.urlsafe_base64(16)
            return random_code unless ShortenedUrl.exists?(short_url: random_code)
        end
    end

    def self.create_for_user_and_long_url(user, long_url)
        ShortenedUrl.create!(
            submitter_id: user.id,
            long_url: long_url,
            short_url: ShortenedUrl.random_code
        )
    end
end
