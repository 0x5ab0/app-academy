require_relative 'questions_database'
require_relative 'user'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'

class Question
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id(id)
        question_data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT
                questions.*
            FROM
                questions
            WHERE
                questions.id = :id
        SQL

        question_data.empty? ? nil : Question.new(question_data.first)
    end

    def self.find_by_author_id(author_id)
        question_data = QuestionsDatabase.instance.execute(<<-SQL, author_id: author_id)
            SELECT
                questions.*
            FROM
                questions
            WHERE
                questions.author_id = :author_id
        SQL

        question_data.empty? ? nil : question_data.map { |question| Question.new(question) }
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def self.most_liked
        QuestionLike.most_liked_questions(n)
    end

    attr_reader :id
    attr_accessor :author_id, :title, :body

    def initialize(options)
        @id = options['id']
        @author_id = options['author_id']
        @title = options['title']
        @body = options['body']
    end

    def attrs
        {
            author_id: author_id,
            title: title,
            body: body
        }
    end

    def save
        if self.id
            QuestionsDatabase.execute(<<-SQL, attrs.merge({ id: id }))
                UPDATE
                    questions
                SET
                    author_id = :author_id,
                    title = :title,
                    body = :body
                WHERE
                    questions.id = :id
            SQL
        else
            QuestionsDatabase.execute(<<-SQL, id: id, author_id: author_id, title: title, body: body)
                INSERT INTO
                    questions (author_id, title, body)
                VALUEs
                    (:author_id, :title, :body)
            SQL

            @id = QuestionsDatabase.last_insert_row_id
        end
        self
    end

    def author
        User.find_by_id(self.author_id)
    end

    def replies
        Reply.find_by_question_id(self.id)
    end

    def followers
        QuestionFollow.followers_for_question_id(self.id)
    end

    def likers
        QuestionLike.likers_for_question_id(self.id)
    end

    def num_likes
        QuestionLike.num_likes_for_question_id(self.id)
    end
end
