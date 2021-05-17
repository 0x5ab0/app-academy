require './list.rb'

class TodoBoard
    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, list, *args = gets.chomp.split(' ')
        list = list.to_sym if !list.nil?

        case cmd
        when 'ls'
            @lists.each_key { |label| puts "- #{label}" }
        when 'showall'
            @lists.each_value(&:print)
        when 'mklist'
            @lists[list] = List.new(list)
        when 'mktodo'
            @lists[list].add_item(*args)
        when 'up'
            @lists[list].up(*args.map(&:to_i))
        when 'down'
            @lists[list].down(*args.map(&:to_i))
        when 'swap'
            @lists[list].swap(*args.map(&:to_i))
        when 'sort'
            @lists[list].sort_by_date!
        when 'priority'
            @lists[list].print_priority
        when 'toggle'
            @lists[list].toggle_item(args[0].to_i)
        when 'rm'
            @lists[list].remove_item(args[0].to_i)
        when 'purge'
            @lists[list].purge
        when 'print'
            if args.empty?
                @lists[list].print
            else
                @lists[list].print_full_item(args[0].to_i)
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while true
            return if !get_command
        end
    end
end

board = TodoBoard.new
board.run