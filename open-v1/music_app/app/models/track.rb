class Track < ApplicationRecord
    validates :name, :ord, presence: true
    validates :bonus, inclusion: { in: [true, false] }
    validates :ord, uniqueness: { scope: :album_id }

    after_initialize :set_defaults

    belongs_to :album
    has_many :notes, dependent: :destroy
    
    private

    def set_defaults
        self.bonus ||= false
    end
end
