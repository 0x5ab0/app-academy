require 'byebug'

def all_words_capitalized?(arr)
    arr.all? do |word|
        word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
    end
end

def no_valid_url?(urls)
    domains = ['.com', '.net', '.io', '.org']
    urls.none? { |url| url.end_with?(*domains) }
end

def any_passing_students?(students)
    students.any? do |student|
        student[:grades].sum / student.length >= 75
    end
end