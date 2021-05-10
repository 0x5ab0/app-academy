require 'byebug'

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? do |char|
      POSSIBLE_PEGS.keys.include?(char.upcase)
    end
  end

  attr_reader :pegs

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map!(&:upcase)
    else
      raise "Error: you've entered one or more invalid characters."
    end
  end

  def self.random(length)
    new_pegs = Array.new(length, POSSIBLE_PEGS.keys.sample) 
    Code.new(new_pegs)
  end

  def self.from_string(pegs_string)
    pegs_array = pegs_string.split('')
    Code.new(pegs_array)
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (0...@pegs.length).count do |i|
      @pegs[i] == guess.pegs[i]
    end
  end

  def num_near_matches(guess)
    (0..@pegs.length).count do |i|
      @pegs.include?(guess.pegs[i]) && guess.pegs[i] != @pegs[i]
    end
  end

  def ==(code)
    @pegs.join('') == code.pegs.join('')
  end
end
