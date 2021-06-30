require_relative 'questions_database'
require_relative 'user'
require_relative 'question'
require_relative 'question_like'
require_relative 'reply'

class QuestionFollow
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| QuestionFollow.new(datum) }
    end

    def self.find_by_id(id)
        follow_data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT
                question_follows.*
            FROM
                question_follows
            WHERE
                question_follows.id = :id
        SQL

        follow_data.empty? ? nil : QuestionFollow.new(follow_data.first)
    end

    def self.find_by_user_id(user_id)
        follow_data = QuestionsDatabase.instance.execute(<<-SQL, user_id: user_id)
            SELECT
                question_follows.*
            FROM
                question_follows
            WHERE
                question_follows.user_id = :user_id
        SQL

        follow_data.empty? ? nil : follow_data.map { |follow| QuestionFollow.new(follow) }
    end

    def self.find_by_question_id(question_id)
        follow_data = QuestionsDatabase.instance.execute(<<-SQL, question_id: question_id)
            SELECT
                question_follows.*
            FROM
                question_follows
            WHERE
                question_follows.question_id = :question_id
        SQL

        follow_data.empty? ? nil : follow_data.map { |follow| QuestionFollow.new(follow) }
    end

    attr_reader :id
    attr_accessor :user_id, :question_id

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end
