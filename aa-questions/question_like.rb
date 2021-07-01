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

    def self.likers_for_question_id(question_id)
        user_data = QuestionsDatabase.instance.execute(<<-SQL, question_id: question_id)
            SELECT
                users.*
            FROM
                question_likes
            LEFT JOIN
                users
            ON
                question_likes.user_id = users.id
            WHERE
                question_likes.question_id = :question_id
        SQL

        user_data.empty? ? nil : user_data.map { |user| User.new(user) }
    end

    def self.num_likes_for_question_id(question_id)
        like_data = QuestionsDatabase.instance.execute(<<-SQL, question_id: question_id)
            SELECT
                COUNT(*) AS num_likes
            FROM
                question_likes
            LEFT JOIN
                questions
            ON
                question_likes.question_id = questions.id
            WHERE
                question_likes.question_id = :question_id
        SQL

        like_data.first['num_likes']
    end

    def self.liked_questions_for_user_id(user_id)
        question_data = QuestionsDatabase.instance.execute(<<-SQL, user_id: user_id)
            SELECT
                questions.*
            FROM
                question_likes
            LEFT JOIN
                questions
            ON
                question_likes.question_id = questions.id
            WHERE
                question_likes.user_id = :user_id
        SQL

        question_data.empty? ? nil : question_data.map { |question| Question.new(question) }
    end

    def self.most_liked_questions(n)
        question_data = QuestionsDatabase.instance.execute(<<-SQL, limit: n)
            SELECT
                questions.*, COUNT(question_likes.user_id) AS likes
            FROM
                question_likes
            LEFT JOIN
                questions
            ON
                question_likes.question_id = questions.id
            GROUP BY
                questions.id
            ORDER BY
                likes DESC
            LIMIT
                :limit
        SQL

        question_data.empty? ? nil : question_data.map { |question| Question.new(question) }
    end
end
