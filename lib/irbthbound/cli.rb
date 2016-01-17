require 'irbthbound/game'

module Irbthbound
  class CLI

  end

  def CLI.main(argv)
    if argv.size > 0
      game = Irbthbound::Game.load_from_file argv[0]
    else
      game = Irbthbound::Game.new
    end

    game.start
  end
end

