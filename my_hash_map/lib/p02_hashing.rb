class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.join.to_i.hash
  end
end

class String
  ALPHABET = ('a'..'z').to_a
  def hash
    chars.map { |ch| ALPHABET.index(ch.downcase) }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.join.hash
  end
end
