require 'aes'
require 'msgpack'
require 'pry'

require 'serializable'
require 'irbthbound/character'
require 'irbthbound/player'

module Irbthbound
  class Game
    include Serializable
    attr_accessor :characters, :locations

    # NOTE: whoever has this key has the power to decrypt and fuck with game
    # save files, but that's OK in my book
    ENCRYPTION_KEY = '09ec9e8b36683fe892eea11c6a842965'

    def save_to_file(filename)
      data = serialize()
      encrypted_data = AES.encrypt MessagePack.pack(data), ENCRYPTION_KEY
      File.write filename, encrypted_data
    end

    def Game.load_from_file(filename)
      encrypted_data = File.read(filename)
      packed_data = AES.decrypt encrypted_data, Game::ENCRYPTION_KEY
      hash = MessagePack.unpack packed_data
      hash.deserialize
    end

    def start
      Pry.config.prompt = [ proc { "ENTER INPUT> " },
                            proc { "MORE INPUT REQUIRED!*" }]
      Pry.start Irbthbound::Player.new(self)
    end
  end

end
