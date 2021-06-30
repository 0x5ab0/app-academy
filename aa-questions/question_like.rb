require_relative 'questions_database'
require_relative 'user'
require_relative 'question'
require_relative 'question_follow'
require_relative 'reply'

class QuestionLike
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map { |datum| QuestionLike.new(datum) }
    end

    def self.find_by_id(id)
        like_data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT
                question_likes.*
            FROM
                question_likes
            WHERE
                question_likes.id = :id
        SQL

        like_data.empty? ? nil : QuestionLike.new(like_data.first)
    end

    def self.find_by_user_id(user_id)
        like_data = QuestionsDatabase.instance.execute(<<-SQL, user_id: user_id)
            SELECT
                question_likes.*
            FROM
                question_likes
            WHERE
                question_likes.user_id = :user_id
        SQL

        like_data.empty? ? nil : like_data.map { |like| QuestionLike.new(like) }
    end

    def self.find_by_question_id(question_id)
        like_data = QuestionsDatabase.instance.execute(<<-SQL, question_id: question_id)
            SELECT
                question_likes.*
            FROM
                question_likes
            WHERE
                question_likes.question_id = :question_id
        SQL

        like_data.empty? ? nil : like_data.map { |like| QuestionLike.new(like) }
    end

    attr_reader :id
    attr_accessor :user_id, :question_id

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end
