# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    "I can't have any more caffeine, but thanks! Why don't you try again?"
  end
end

class NotAFruitError < StandardError
  def message
    "That's not a fruit where I come from."
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise CoffeeError
  else
    raise NotAFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
end  

# PHASE 4

class NotFriendsEnoughError < StandardError
  def message
    "Shut up. I don't trust like that. Not unless we've been friends for 5 years at least."
  end
end

class NoNameError
  def message
    "Come on, at least tell me your name first!"
  end
end

class NoPastimeError
  def message
    "I really, really need to know what your favorite pastime is first."
  end
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

    if @yrs_known < 5
      raise NotFriendsEnoughError
    elsif @name.empty?
      raise NoNameError
    elsif @fav_pastime.empty?
      raise NoPastimeError
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


