class Response < ApplicationRecord
    validate :respondent_is_not_poll_author, unless -> { answer_choice.nil? }

    belongs_to :answer_choice,
      primary_key: :id,
      foreign_key: :answer_choice_id,
      class_name: 'AnswerChoice'
  
    belongs_to :respondent,
      primary_key: :id,
      foreign_key: :respondent_id,
      class_name: 'User'
  
    has_one :question,
     through: :answer_choice,
     source: :question

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end

    def respondent_already_answred?
        self.sibling_responses.exists?(respondent_id: self.respondent_id)
    end

    private

    def respondent_is_not_poll_author
        poll_author_id = Poll
            .joins(questions: :answer_choices)
            .where('answer_choices.id = ?', self.answer_choice_id)
            .pluck('polls.author_id')
            .first

        if poll_author_id == self.respondent_id
            errors[:respondent_id] << 'cannot be poll author'
        end
    end
end
