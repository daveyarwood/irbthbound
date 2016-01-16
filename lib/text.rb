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

