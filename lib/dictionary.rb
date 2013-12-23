require 'set'

class Dictionary
  def initialize
    @set = Set.new
  end

  def add(word)
    raise_error_if_empty!(word)

    @set << word
  end

  def count
    @set.count
  end

  def include?(word)
    raise_error_if_empty!(word)

    @set.include?(word)
  end

  def has_word_starting_with?(string)
    raise_error_if_empty!(string)

    @set.any? { |word| word.start_with?(string) }
  end

  private

  def raise_error_if_empty!(string)
    raise ArgumentError, 'Empty string not allowed' if string.empty?
  end
end