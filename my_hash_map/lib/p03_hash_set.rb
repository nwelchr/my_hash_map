require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    resize! if count >= num_buckets && !include?(key)
    unless include?(key)
      @store[key.hash % @num_buckets] << key
      @count += 1
    end
  end

  def include?(key)
    @store[key.hash % @num_buckets].include?(key)
  end

  def remove(key)
    @store[key.hash % @num_buckets].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets *= 2
    resized_set = Array.new(@num_buckets) { Array.new }

    @store.each do |bucket|
      bucket.each do |key|
        resized_set[key.hash % @num_buckets] << key
      end
    end
    @store = resized_set
  end
end
