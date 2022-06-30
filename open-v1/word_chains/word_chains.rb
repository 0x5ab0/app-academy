require 'set'

class WordChainer
    def self.read_dictionary(filename)
        set = Set[]
        File.readlines(filename, chomp: true).each do |word|
            set << word
        end
        set
    end
    
    def initialize(dictionary_filename)
        @dictionary = WordChainer.read_dictionary(dictionary_filename)
    end

    def run(source, target)
        @current_words, @all_seen_words = [source], { source => nil }

        until @current_words.empty? || @all_seen_words.include?(target)
            explore_current_words
        end

        build_path(target)
    end

    def explore_current_words
        new_current_words = []

        @current_words.each do |current_word|
            adjacent_words(current_word).each do |adjacent_word|
                next if @all_seen_words.key?(adjacent_word)

                new_current_words << adjacent_word
                @all_seen_words[adjacent_word] = current_word
            end
        end

        @current_words = new_current_words

        # new_current_words.each do |word|
        #     puts "#{word}, from #{@all_seen_words[word]}"
        # end
    end

    def build_path(target)
        path = []
        current_word = target
        
        until current_word.nil?
            path << current_word
            current_word = @all_seen_words[current_word]
        end

        path.reverse
    end

    def adjacent_words(source_word)
        @dictionary.select do |word|
            if same_length?(source_word, word)
                target_match_count = source_word.length - 1
                actual_match_count = count_common_characters(source_word, word)
                
                target_match_count == actual_match_count
            end
        end
    end

    def same_length?(word_1, word_2)
        word_1.length == word_2.length
    end

    def count_common_characters(word_1, word_2)
        word_2.chars.each_index.count do |i|
            word_1[i] == word_2[i]
        end
    end
end

if $PROGRAM_NAME == __FILE__
    # provide file name on command line like so: <ruby word_chains.rb dictionary.txt>
    p WordChainer.new(ARGV.shift).run("duck", "ruby")
  end  