=begin
This file contains some helpful methods used by the
battle equations and so on, to provide weighted random
values for things like generating a percentage in the
range of +/- 50%, where the value is more likely to be
closer to 0%, à la a pyramid-shaped distribution.
=end

def plus_or_minus(p)  # +/- "n" percent (50, 25, etc.)

  q = 1
  lower = 1
  upper = 1
  table = Hash.new

  (-p..p).to_a.each do |prob|
    upper = lower + (q - 1)
    
    (lower..upper).to_a.each do |k|
      table[k] = prob
    end

    q += 1 if prob < 0
    q -= 1 if prob >= 0

    lower = upper + 1
  end
  
  table[rand(1..upper)].to_f / 100
  
end
