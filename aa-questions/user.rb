require_relative 'questions_database'
require_relative 'question'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'

class User
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_id(id)
        user_data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT
                users.*
            FROM
                users
            WHERE
                users.id = :id
        SQL

        user_data.empty? ? nil : User.new(user_data.first)
    end

    def self.find_by_name(fname, lname)
        user_data = QuestionsDatabase.instance.execute(<<-SQL, fname: fname, lname: lname)
            SELECT
                users.*
            FROM
                users
            WHERE
                users.fname = :fname AND users.lname = :lname
        SQL

        user_data.empty? ? nil : user_data.map { |user| User.new(user) }
    end

    attr_reader :id
    attr_accessor :fname, :lname

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(self.id)
    end

    def liked_questions
        QuestionLike.liked_questions_for_user_id(self.id)
    end

    def average_karma
        karma_data = QuestionsDatabase.instance.execute(<<-SQL, author_id: self.id)
            SELECT
                CAST(COUNT(question_likes.id) AS FLOAT) /
                    COUNT(DISTINCT(questions.id)) AS avg_karma
            FROM
                questions
            LEFT JOIN
                question_likes
            ON
                questions.id = question_likes.question_id
            WHERE
                questions.author_id = :author_id
        SQL
        
        karma_data.first['avg_karma']
    end
end
