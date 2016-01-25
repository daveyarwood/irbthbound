module Util
  # Returns a percentage in the range of plus or minus `p`, where the value is
  # more likely to be closer to 0, as in a pyramid-shaped distribution.
  #
  # e.g. `plus_or_minus(25)` will return a value between -0.25 and 0.25, likely
  # closer to 0.
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
end

class String
  # Divides a string up into n-character lines.  Pushes a word down onto the
  # next line if it doesn't fit, like on a page in a book.
  def line_divide(n)
    answer = []
    src = self.chars

    loop do # for each line...
      # remove any leading space from the line
      src = src.join.strip.split('')

      case src[n-1] # checks the nth character
      when ' ', '-'
        answer << src.shift(n).join
      when nil # if line < n characters
        answer << src.shift(n).join
        break
      else # if n+1th character is not ' ' or '-'
        if src[n] == ' '
          answer << src.shift(n).join
        else  # if nth character is mid-word
          i = (/[ -]/ =~ src[0,n].join.reverse)
          answer << src.shift(n - i).join
        end
      end
    end
    answer.join("\n")
  end

  # Divides a string up into 80-character lines.
  def eighty
    self.line_divide(80)
  end
end

