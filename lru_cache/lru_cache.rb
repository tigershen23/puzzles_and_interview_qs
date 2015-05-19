#!/usr/bin/env ruby

# LRU Cache: Least Recently Used Cache
# Implementation of a cache (key-value store) with a configurable limit
# of pairs to store. When an element is added at the cache's limit, it
# discards the least recently used element. A "use" is defined as either
# a "find" or "add" in this context.

class LruCache
  INVALID_KEYS = ['dummy_head', 'dummy_tail']

  def initialize(size_limit:)
    @size_limit = size_limit + 2 # adjust for dummy head and tail
    @nodes = {}

    set_up_dummy_nodes
  end

  def add(key, value)
    return if invalid_key?(key)

    @nodes[key] = add_to_tail(Node.new(key, value))

    if @nodes.size > @size_limit
      evict_lru
    end
  end

  def find(key)
    return if invalid_key?(key)

    node = @nodes[key]

    if node
      set_as_tail(node)
      return node.value
    else
      ''
    end
  end

  private

  def dummy_tail
    @nodes["dummy_tail"]
  end

  def dummy_head
    @nodes["dummy_head"]
  end

  def logical_tail
    dummy_tail.previous_node
  end

  def invalid_key?(key)
    INVALID_KEYS.include?(key)
  end

  def add_to_tail(node)
    node.next_node = dummy_tail
    node.previous_node = logical_tail
    logical_tail.next_node = node
    dummy_tail.previous_node = node

    node
  end

  # replaces the references surrounding the node's original position,
  # then moves the node to the tail of the list
  def set_as_tail(node)
    previous_node = node.previous_node
    next_node = node.next_node
    previous_node.next_node = node.next_node
    next_node.previous_node = previous_node
    add_to_tail(node)

    node
  end

  def evict_lru
    lru = dummy_head.next_node
    new_lru = lru.next_node
    dummy_head.next_node = new_lru
    new_lru.previous_node = dummy_head
    @nodes.delete(lru.key)
  end

  def set_up_dummy_nodes
    dummy_head = Node.new('', 'dummy head')
    dummy_tail = Node.new('', 'dummy tail')
    dummy_tail.previous_node = dummy_head
    dummy_head.next_node = dummy_tail

    @nodes["dummy_head"] = dummy_head
    @nodes["dummy_tail"] = dummy_tail
  end
end

class Node
  attr_reader :key, :value
  attr_accessor :next_node, :previous_node

  def initialize(key, value, previous_node = nil, next_node = nil)
    @key = key
    @value = value
    @previous_node = previous_node
    @next_node = next_node
  end
end

# cache = LruCache.new(size_limit: 3)

# cache.add("name", "tiger")
# puts "should be tiger: #{cache.find("name")}"

# cache.add("age", "16")
# puts "should be 16: #{cache.find("age")}"

# cache.add("shoe_size", "9.5")
# cache.add("hair_color", "black")
# puts "should be empty: #{cache.find("name")}"

# cache.find("age")
# cache.add("height", "five_seven")
# puts "should be empty: #{cache.find("shoe_size")}"

# puts "access with dummy key should be empty: #{cache.find("dummy_tail")}"
