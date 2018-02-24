class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise "Out of bounds" unless num.between?(0, @max)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    @store[num % @num_buckets] << num
  end

  def remove(num)
    @store[num % @num_buckets].delete(num)
  end

  def include?(num)
    @store[num % @num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    resize! if count >= num_buckets && !include?(num)
    unless include?(num)
      @store[num % @num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    @store[num % @num_buckets].delete(num)
  end

  def include?(num)
    @store[num % @num_buckets].include?(num)
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
      bucket.each do |num|
        resized_set[num % @num_buckets] << num
      end
    end
    @store = resized_set
  end
end
