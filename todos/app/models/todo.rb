
# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :string           not null
#  done       :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

class Todo < ApplicationRecord
    validates :title, :body, presence: true
    validates :done, inclusion: { in: [true, false] }

    has_many :steps
end
