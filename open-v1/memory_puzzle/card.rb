class Card
    VALUES = '🦁🐶🐱🐯🐴🐮🐷🐭🦊🐲🌚🌝🐺🥵🥶👽👾🤖👺👹🤡💩💀👻'.split('') # 24 values to choose from
    
    def self.shuffled_pairs(num_pairs)
        values = VALUES
    
        while num_pairs > values.length
            values = values + values
        end
    
        values = values.shuffle.take(num_pairs) * 2
        values.shuffle!
        values.map { |val| self.new(val) }
    end
    
    attr_reader :value
    
    def initialize(value, revealed = false)
        @value = value
        @revealed = revealed
    end
    
    def hide
        @revealed = false
    end
    
    def to_s
        revealed? ? value.to_s : "__"
    end
    
    def reveal
        @revealed = true
    end
    
    def revealed?
        @revealed
    end
    
    def ==(object)
        object.is_a?(self.class) && object.value == value
    end
end