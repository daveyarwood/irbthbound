require_relative 'naming.rb'

# Start New Game

# from naming.rb; this method goes through all the naming
# stuff and then initializes $ness, $paula, $jeff, $poo, $king, 
# $steak and $rockin using the names the player has chosen
naming  

[$ness, $paula, $jeff, $poo, $king, $steak, $rockin].each {|x| p x}
