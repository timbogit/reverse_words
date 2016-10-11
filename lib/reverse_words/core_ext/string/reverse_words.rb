class String
  # Returns a copy of the string where the order of all words in the string
  # is reversed.
  #
  # Leading, trailing, and duplicate interspersed blanks are removed from the output.
  # Punctuation and capitalization are left as they are in receiving string.
  #
  #   'hello world'.reverse_words               # => "world hello"
  #   'The black cat!'.reverse_words            # => "cat black The!"
  #   ' string  with  blanks !? '.reverse_words #=> "blanks with string!?"
  def reverse_words
    stripped = self.strip
    len = stripped.length
    punct_idx = punctuation_index(stripped, len)

    result = reverse_unpunctuated(stripped[0...punct_idx])
    result += stripped[punct_idx...len] if punct_idx < len
    result
  end

  # Modifies the receiving string object to contain the result of calling +reverse_words+
  # on the string.
  #
  # Returns +nil+
  #
  #   str = 'hello world' #=> "hello world"
  #   str.reverse_words!  #=> nil
  #   str                 #=> "world hello"
  def reverse_words!
    self[0..-1] = reverse_words[0..-1]
    nil
  end

  private

  def reverse_unpunctuated(unpuncated_string)
    unpuncated_string.split(' ').reverse!.join(' ')
  end

  def punctuation_index(string, length)
    (/(\.|\!|\?)*$/ =~ string) || string.length
  end
end
