class WordDict
  END_CHAR = ';'

  def initialize(words)
    self.trie = {}
    self.word_count = 0

    words.each { |w| insert(w) }
  end

  def word?(word)
    subtrie(word).key?(END_CHAR)
  end

  def insert(word)
    self.word_count = word_count + 1

    chars = word.split('')

    cur = trie
    chars.each do |char|
      cur[char] ||= {}
      cur = cur[char]
    end
    cur[END_CHAR] = {}
  end

  def inspect
    "#<WordDict (#{word_count} words)>"
  end

  private

  attr_accessor :word_count, :trie

  def subtrie(str)
    cur = trie

    str.split('').each do |char|
      if cur[char]
        cur = cur[char]
      else
        return {}
      end
    end

    cur
  end
end

words = open('dict.txt').read.split("\n")
w = WordDict.new(words)
