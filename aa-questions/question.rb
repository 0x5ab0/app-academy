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

    attr_reader :id
    attr_accessor :author_id, :title, :body

    def initialize(options)
        @id = options['id']
        @author_id = options['author_id']
        @title = options['title']
        @body = options['body']
    end
end
