class Playable

  def self.metaclass; class << self; self; end; end
  
  def self.traits(*arr)
    return @traits if arr.empty?
    attr_accessor *arr
    arr.each do |a|
      metaclass.instance_eval do
        define_method(a) do |val|
          @traits ||= {}
          @traits[a] = val
        end
      end
    end
    
    class_eval do
      define_method(:initialize) do
        self.class.traits.each do |k,v|
          instance_variable_set("@#{k}", v)
        end
      end
    end
    
  end
  
  traits :exp, :level, :max_hp, :hp, :max_pp, :pp, :offense,
         :defense, :speed, :guts, :luck, :vitality, :iq,
         :status, :name 
           
end
         
class Ness < Playable
  name "Ness"
  exp 0; level 1
  hp 30; max_hp 30
  pp 10; max_pp 10
  offense 2; defense 2; speed 2; guts 2
  vitality 2; iq 2; luck 2
end

class Paula < Playable
  name "Paula"
  exp 0; level 1
  hp 30; max_hp 30
  pp 10; max_pp 10
  offense 2; defense 2; speed 2; guts 2
  vitality 2; iq 2; luck 2
end

class Jeff < Playable
  name "Jeff"
  exp 0; level 1
  hp 30; max_hp 30
  pp 0; max_pp 0
  offense 2; defense 2; speed 2; guts 2
  vitality 2; iq 2; luck 2
end

class Poo < Playable
  name "Poo"
  exp 0; level 1
  hp 30; max_hp 30
  pp 10; max_pp 10
  offense 2; defense 2; speed 2; guts 2
  vitality 2; iq 2; luck 2
end
