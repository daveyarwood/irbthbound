module Irbthbound
  class Character
    include Serializable
    attr_accessor :name

    def Character.deserialize(data)
      char = Character.new
      char.name = data['name']
      char
    end
  end
end
