# default implementations of serialize and deserialize -- just return self as-is
class Object
  def serialize
    self
  end

  def deserialize
    self
  end
end

# Serializable can be mixed into a custom class to provide a decent
# implementation of serialize. It creates a hash-map of the instance's instance
# variables, as well as an `irbthbound_class` key so we can keep track of what
# class the thing is and later deserialize it into an instance of that class.
module Serializable
  def serialize
    data = {'irbthbound_class' => self.class.to_s}
    self.instance_variables.each do |var|
      data[var.to_s] = self.instance_variable_get(var).serialize
    end
    data
  end
end

# MessagePack can't handle symbols... fuck that, time for some hacks!
class Symbol
  def serialize
    'SERIALIZED_SYMBOL:' << self.to_s
  end
end

class String
  def deserialize
    if self.start_with? 'SERIALIZED_SYMBOL:'
      self[self.index(':') + 1..-1].to_sym
    else
      self
    end
  end
end

class Array
  def serialize
    self.map(&:serialize)
  end

  def deserialize
    self.map(&:deserialize)
  end
end

class Hash
  def serialize
    Hash[self.map {|k, v| [k.serialize, v.serialize]}]
  end

  def deserialize
    if self.has_key? 'irbthbound_class'
      x = Object.const_get(self['irbthbound_class']).new
      self.each do |k, v|
        if k.start_with? '@'
          x.instance_variable_set k.to_sym, v.deserialize
        end
      end
      x
    else
      Hash[self.map {|k, v| [k.deserialize, v.deserialize]}]
    end
  end
end
