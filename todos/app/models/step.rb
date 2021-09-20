# == Schema Information
#
# Table name: steps
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  todo_id    :integer
#  done       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Step < ApplicationRecord
    validates :title, presence: true
    validates :done, inclusion: { in: [true, false] }

    after_initialize { self.done = false if self.done.nil? }

    belongs_to :todo
end
