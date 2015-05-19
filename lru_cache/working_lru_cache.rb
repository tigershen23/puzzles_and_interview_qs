require 'pry-byebug'

# key-value store with a configurable limit
# once it reaches the limit, when a new element is added, discard the
# least recently used element

class LruCache
  attr_reader :nodes

  def initialize(size_limit)
    @size_limit = size_limit + 2 # adjust for dummy head and tail
    dummy_head = Node.new('', 'dummy head', nil, nil)
    dummy_tail = Node.new('', 'dummy tail', nil, dummy_head)
    dummy_head.pointer = dummy_tail
    @nodes = {
      "dummy_head" => dummy_head,
      "dummy_tail" => dummy_tail
    }
  end

  def add(key, value)
    # elements[key] = [value, Time.now]
    # binding.pry
    previous_tail = @nodes["dummy_tail"].previous_node
    node_to_add = Node.new(key, value, @nodes["dummy_tail"], previous_tail)
    previous_tail.pointer = node_to_add
    @nodes["dummy_tail"].previous_node = node_to_add
    # binding.pry

    # current_node = @root_node
    # while current_node.has_next?()
    #  current_node = current_node.get_next()
    # end
    # current_node.set_next(node)
    # node.set_prev(current_node)
    @nodes[key] = node_to_add

    if @nodes.size > @size_limit
      binding.pry
      lru = @nodes["dummy_head"].pointer
      new_lru = lru.pointer
      @nodes["dummy_head"].pointer = new_lru
      new_lru.previous_node = @nodes["dummy_head"]
      @nodes.delete(lru.key)
    end
  end

  def find(key)
    node = @nodes[key]
    if node
      binding.pry
      previous_node = node.previous_node # dummy_head
      # if previous_node = @nodes["dummy_head"]
        # return node.value
      # end
      next_node = node.pointer # shoe_size
      previous_node.pointer = node.pointer #dummy_head --> shoe_size
      next_node.previous_node = previous_node # shoe size --> dummy head
      previous_tail = @nodes["dummy_tail"].previous_node # hair color
      previous_tail.pointer = node # hair color --> age
      node.pointer = @nodes["dummy_tail"] # age --> dummy tail
      node.previous_node = previous_tail # age --> hair color
      @nodes["dummy_tail"].previous_node = node # dummy tail --> age
      # dummy head's pointer should be shoe size

      node.value # age of 16
    else
      ''
    end
  end
end

class Node
  attr_reader :key, :value
  attr_accessor :pointer, :previous_node

  def initialize(key, value, pointer, previous_node)
    @key = key
    @value = value
    @pointer = pointer
    @previous_node = previous_node
  end
end

cache = LruCache.new(3)
cache.add("name", "tiger")
puts "should be tiger: #{cache.find("name")}"

cache.add("age", "16")
puts "should be 16: #{cache.nodes["dummy_tail"].previous_node.value}"
puts "should be tiger: #{cache.nodes["dummy_head"].pointer.value}"
puts "should be tiger: #{cache.nodes["age"].previous_node.value}"

cache.add("shoe_size", "9.5")
cache.add("hair_color", "black")

puts "should be empty: #{cache.find("name")}"

cache.find("age")
cache.add("height", "five_seven")
puts "should be empty: #{cache.find("shoe_size")}"
