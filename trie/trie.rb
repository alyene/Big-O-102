class Trie
  END_CHAR = ';'

  def self.from_file(file)
    words = open(file).read.split("\n")
    new(words)
  end

  def initialize(words)
    self.store = {}

    self.word_count = 0
    self.node_count = 0
    self.char_count = 0

    words.each { |w| insert(w) }
  end

  def word?(word)
    subtrie(word).key?(END_CHAR)
  end

  def insert(word)
    self.word_count = word_count + 1
    self.char_count = char_count + word.length

    chars = word.split('')

    cur = store
    chars.each do |char|
      if !cur[char]
        self.node_count = node_count + 1
        cur[char] = {}
      end

      cur = cur[char]
    end
    cur[END_CHAR] = {}

    word # might as well return the word
  end

  def inspect
    "#<#{self.class} (#{word_count} words, #{node_count} nodes, #{char_count} letters)>"
  end

  private

  attr_accessor :store, :node_count, :char_count, :word_count

  def subtrie(str)
    cur = store

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

# playground
trie = Trie.from_file('trie/dict.txt')

trie.word?('dot') # => true
trie.word?('doting') # => true
trie.word?('dotingly') # => true
trie.word?('dotinglyyy') # => false
trie.word?('notaword') # => false
