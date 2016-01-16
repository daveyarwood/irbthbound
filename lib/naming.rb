require_relative 'player_stats'
require_relative 'text'

# When you start the main module, you will see a k3wl 
# ASCII art Earthbound logo or something, and then you'll
# be allowed to start a new game or load an existing one.

# When you start a new game, this stuff will happen.

def naming

  intro_p = "You are somewhere. Or rather, you are nowhere in particular. You exist, but you are getting ready to exist, if that makes sense. Let's just say you're sitting in front of your computer terminal (you retro dog, you), just itching to embark upon the text adventure remake of the most poignant SNES RPG of the 90's, which, if you're a Gen X/Y-er, was probably a vital part of your childhood and/or adolescence. Your brain cells twitch with excitement. Before we get started, let's name some stuff."

  ness = {
  :desc => "You see before you an intrepid young boy in a sporty red baseball cap, a familiar-looking yellow-and-blue T-shirt, a yellow backpack, blue shorts and red-and-white sneakers. You somehow sense that there is something very important about this youngster.",
  :prompt => "Please name him.",
  :him_her => "him",
  :dont_care => ['Ness', 'Alec', 'Roger', 'Will', 'Brian', 'Tyler', 'Lane'],
  :name => nil
  }

  paula = {
  :desc => "Now you see a pretty, happy-go-lucky girl in a pink dress. She exudes energy and life. You can only hope that one day you will meet.",
  :prompt => "Name her, too.",
  :him_her => "her",
  :dont_care => ['Paula', 'Nancy', 'Skye', 'Paige', 'Marie', 'Holly', 'Jane'],
  :name => nil
  }

  jeff = {
  :desc => "Your friend walks up. You're not sure how you know he's your friend, but it's obvious to you that he is. He's dressed in a dapper, olive-colored suit with a black bow-tie and thick specs. Your friend looks like he takes life seriously.",
  :prompt => "Name your friend.",
  :him_her => "him",
  :dont_care => ['Jeff', 'Dan', 'Henry', 'Isaac', 'Ralph', 'Sean', 'Rob'],
  :name => nil
  }

  poo = {
  :desc => "Before you now is a curious-looking fellow you imagine to be from a distant land. He is clad in a black-and-white martial arts outfit, sports a conspicuous hairdo resembling a traditional Chinese top-knot, and appears quite disciplined.",
  :prompt => "Name another friend.",
  :him_her => "him",
  :dont_care => ['Poo', 'Kato', 'Kai', 'Omar', 'Ramin', 'Aziz', 'Lado'],
  :name => nil
  }

  king = {
  :desc => "You recall that you have a dog -- a big, fluffy, white, happy dog.",
  :prompt => "Name your pet.",
  :him_her => "him",
  :dont_care => ['King', 'Peach', 'Sparky', 'Rex', 'Baby', 'Rover', 'Misty'],
  :name => nil
  }

  food = {
  :prompt => "Now, tell me this... what's your favorite homemade food?",
  :dont_care => ['Steak', 'Pie', 'Pasta', 'Cake', 'Eggs', 'Bread', 'Salmon'],
  :name => nil
  }

  fav_thing = {
  :prompt => "And what is your favorite thing?",
  :dont_care => ['Rockin', 'Hammer', 'Love', 'Gifts', 'Slime', 'Gaming', 'Boxing'],
  :name => nil
  }

  $chars = [ness, paula, jeff, poo, king]
  $things = [food, fav_thing]

  def name_char(char, i=0)
    puts "\n#{char[:desc].eighty}\n"
    catch (:done) do
      puts "\n#{char[:prompt]}\n"
      puts "\n(Please enter a name, or type 'dc' if you 'Don't Care,' and then press ENTER.)".eighty
      print ">> "
      name = gets.strip
      if name.downcase == "dc"
        puts "\nOK, how about '#{char[:dont_care][i]}'? (y/n)"
        loop do
          print ">> "
          answer = gets.strip
          case answer.downcase[0]
          when "y"
            char[:name] = char[:dont_care][i]
            throw :done
          when "n"
            puts "\n" + "OK. Let's start over, then. If you still don't care, then I can come up with something else -- just type 'dc' again and I'll see what I can do.".eighty + "\n"
            name_char(char, (i + 1) % char[:dont_care].length)
            return
          else
            puts "(Y)es or (N)o, please."
          end
        end
      else
        puts "\nAre you sure you want to name #{char[:him_her]} '#{name}'? (y/n)"
        loop do
          print ">> "
          answer = gets.strip
          case answer.downcase[0]
          when "y"
            char[:name] = name
            throw :done
          when "n"
            puts "\nOK. Let's start over.\n"
            name_char(char)
            return
          else
            puts "(Y)es or (N)o, please."
          end
        end
      end
    end

    puts "\nOK desu ka! You watch #{char[:name]} walk away.\n"
  end

  def name_thing(thing, i=0)
    catch (:done) do
      puts "\n#{thing[:prompt]}\n"
      puts "\n(Please enter your answer, or type 'dc' if you 'Don't Care,' and then press ENTER.)".eighty
      print ">> "
      name = gets.strip
      if name.downcase.strip == "dc"
        puts "\nHmm... how about '#{thing[:dont_care][i]}'? (y/n)"
        loop do
          print ">> "
          answer = gets.strip
          case answer.downcase[0]
          when "y"
            thing[:name] = thing[:dont_care][i]
            throw :done
          when "n"
            puts "\n" + "OK. Let's start over, then. If you still don't care, then I can come up with something else -- just type 'dc' again and I'll see what I can do.".eighty + "\n"
            name_thing(thing, (i + 1) % thing[:dont_care].length)
            return
          else
            puts "(Y)es or (N)o, please."
          end
        end
      else
        puts "\nAre you sure it's '#{name}'? (y/n)"
        loop do 
          print ">> "
          answer = gets.strip
          case answer.downcase[0]
          when "y"
            thing[:name] = name
            throw :done
          when "n"
            puts "\nOK. Let's start over.\n"
            name_thing(thing)
            return
          else
            puts "(Y)es or (N)o, please."
          end
        end
      end
    end

    puts "\nOK desu ka!\n"
  end

  def name_stuff
    $chars.each {|char| name_char(char) }
    $things.each {|thing| name_thing(thing) }
  end

  def confirm_choices
    puts "\nAlright, so to sum up your choices...\n"

    puts "\nBoy 1: #{$chars[0][:name]}"
    puts "Girl: #{$chars[1][:name]}"
    puts "Boy 2: #{$chars[2][:name]}"
    puts "Boy 3: #{$chars[3][:name]}"

    puts "\nDog: #{$chars[4][:name]}"

    puts "\nFavorite food: #{$things[0][:name]}"
    puts "Coolest thing: #{$things[1][:name]}"

    puts "\nAre you happy with this? (y/n)"
    loop do
      print ">> "
      answer = gets.strip
      case answer.downcase[0]
      when "y"
        return true
      when "n"
        puts "\n" + "OK. Then let's start all over."
        return false
      else
        puts "(Y)es or (N)o, please."
      end
    end
  end

  puts "\n#{intro_p.eighty}\n"

  loop do
    name_stuff
    break if confirm_choices
  end

  puts "\nOK, let's do this! Waaow!!\n" 

  # initializes all 4 characters with the
  # starting 'level 1' stats, and the names
  # the player has chosen
  $ness = Ness.new; $ness.name = ness[:name]
  $paula = Paula.new; $paula.name = paula[:name]
  $jeff = Jeff.new; $jeff.name = jeff[:name]
  $poo = Poo.new; $poo.name = poo[:name]

  # sets global variables i.e. Rockin and Steak
  $king = king[:name]
  $steak = food[:name]
  $rockin = fav_thing[:name]

end
