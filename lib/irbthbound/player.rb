module Irbthbound
  class Player
    def initialize(game)
      # Because this a class variable instead of an instance variable, the
      # player is not able to access it within the Pry context, not even if
      # he/she types @@game. This provides a nice, locked-down sandbox
      # environment in which the player only has access to instance methods.
      @@game = game
    end

    def foo
      2
    end

    # not accessible
    @bar = 3

    def greet
      "You say 'hey'."
    end

    def chars
      @@game.characters
    end

    def locs
      @@game.locations
    end
  end
end
