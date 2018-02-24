class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    n = first
    while n != @tail
      return n.val if n.key == key
      n = n.next
    end
    nil
  end

  def include?(key)
    n = first
    while n != @tail
      return true if n.key == key
      n = n.next
    end
    false
  end

  def append(key, val)
    n = Node.new(key, val)
    @head.next = n if empty? # set head's next if first el
    n.next = @tail # set next for new node
    n.prev = last # set prev for new node
    last.next = n # reset next for next most recent node
    @tail.prev = n # reset tail's prev value
  end

  def update(key, val)
    n = first
    while n != @tail
      if n.key == key
        n.val = val
        break
      end
      n = n.next
    end
  end

  def remove(key)
    n = first
    while n != @tail
      if n.key == key
        n.key = nil
        n.val = nil
        n.prev.next = n.next
        n.next.prev = n.prev
        break
      end
      n = n.next
    end
  end

  def each(&blk)
    n = first
    while n != @tail
      blk.call(n)
      n = n.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
