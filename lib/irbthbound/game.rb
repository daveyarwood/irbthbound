require 'msgpack'
require 'pry'

require 'irbthbound/player'

module Irbthbound
  class Game
    attr_accessor :characters, :locations

    # NOTE: whoever has this salt has the power to decrypt and fuck with game
    # save files, but that's OK in my book
    @@salt = '$2a$10$/uCgVxSVZEHa0p224cHQi.'

    def save_to_file(filename)
      data = {'characters' => @characters,
              'locations'  => @locations}
      File.write filename, MessagePack.pack(data)
    end

    def start
      Pry.config.prompt = [ proc { "ENTER INPUT> " }, proc { "MORE INPUT REQUIRED!*" }]
      Pry.start Irbthbound::Player.new
    end
  end

  def Game.load_from_file(filename)
    data = MessagePack.unpack File.read(filename)
    gs = Game.new
    gs.characters = data['characters']
    gs.locations = data['locations']
    gs
  end
end
