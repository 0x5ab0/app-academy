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

    def self.followers_for_question_id(question_id)
        follower_data = QuestionsDatabase.instance.execute(<<-SQL, question_id: question_id)
            SELECT
                users.*
            FROM
                question_follows
            LEFT JOIN
                users
            ON
                question_follows.user_id = users.id
            WHERE
                question_follows.question_id = :question_id
        SQL

        follower_data.empty? ? nil : follower_data.map { |follower| User.new(follower) }
    end

    def self.followed_questions_for_user_id(user_id)
        question_data = QuestionsDatabase.instance.execute(<<-SQL, user_id: user_id)
            SELECT
                questions.*
            FROM
                question_follows
            LEFT JOIN
                questions
            ON
                question_follows.question_id = questions.id
            WHERE
                question_follows.user_id = :user_id
        SQL

        question_data.empty? ? nil : question_data.map { |question| Question.new(question) }
    end

    def self.most_followed_questions(n)
        question_data = QuestionsDatabase.instance.execute(<<-SQL, limit: n)
            SELECT
                questions.*, COUNT(question_follows.user_id) AS followers
            FROM
                question_follows
            LEFT JOIN
                questions
            ON
                question_follows.question_id = questions.id
            GROUP BY
                questions.id
            ORDER BY
                followers DESC
            LIMIT
                :limit
        SQL

        question_data.empty? ? nil : question_data.map { |question| Question.new(question) }
    end
end
