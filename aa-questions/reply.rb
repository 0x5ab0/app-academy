require_relative 'questions_database'
require_relative 'user'
require_relative 'question'
require_relative 'question_follow'
require_relative 'question_like'

class Reply
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_id(id)
        reply_data = QuestionsDatabase.instance.execute(<<-SQL, id: id)
            SELECT
                replies.*
            FROM
                replies
            WHERE
                replies.id = :id
        SQL

        reply_data.empty? ? nil : Reply.new(reply_data.first)
    end

    def self.find_by_question_id(question_id)
        reply_data = QuestionsDatabase.instance.execute(<<-SQL, question_id: question_id)
            SELECT
                replies.*
            FROM
                replies
            WHERE
                replies.question_id = :question_id
        SQL

        reply_data.empty? ? nil : reply_data.map { |reply| Reply.new(reply) }
    end

    def self.find_by_parent_reply_id(parent_reply_id)
        reply_data = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id: parent_reply_id)
            SELECT
                replies.*
            FROM
                replies
            WHERE
                replies.parent_reply_id = :parent_reply_id
        SQL

        reply_data.empty? ? nil : reply_data.map { |reply| Reply.new(reply) }
    end

    def self.find_by_author_id(author_id)
        reply_data = QuestionsDatabase.instance.execute(<<-SQL, author_id: author_id)
            SELECT
                replies.*
            FROM
                replies
            WHERE
                replies.author_id = :author_id
        SQL

        reply_data.empty? ? nil : reply_data.map { |reply| Reply.new(reply) }
    end

    attr_reader :id
    attr_accessor :question_id, :parent_reply_id, :author_id, :body
    
    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @author_id = options['author_id']
        @body = options['body']
    end
end
