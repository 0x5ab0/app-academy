class User < ApplicationRecord
    validates :email, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :password_digest, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true

    attr_reader :password

    after_initialize :ensure_session_token

    has_many :notes, dependent: :destroy

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        
        user && user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        @session_token = SecureRandom.urlsafe_base64(16)
    end

    attr_reader :password

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(@password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!

        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end
end
