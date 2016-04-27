module Irbthbound
  class Scene
    def initialize(game)
      @game = game
    end

    # The main method to be executed when the scene starts.
    def start
      raise NotImplementedError.new("#{self.class.name}.start is not implemented.")
    end

    # Kicks off whatever should happen after the scene ends.
    #
    # e.g. another scene, entering a new area, etc.
    def next
      raise NotImplementedError.new("#{self.class.name}.next is not implemented.")
    end

    def load_script(filename)
      File.read "../../assets/script/#{filename}"
    end
  end
end
