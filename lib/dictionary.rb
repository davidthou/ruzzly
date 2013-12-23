require 'set'

class Dictionary
  def initialize
    @set = Set.new
  end

  def add(word)
    @set << word
  end

  def count
    @set.count
  end

  def include?(word)
    @set.include?(word)
  end
end