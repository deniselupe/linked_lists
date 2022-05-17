# Class for Node objects
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

# Class for Linked List objects
class LinkedList
  attr_accessor :head

  def initialize(head)
    @head = head
  end

  def append(value)
    current_node = @head

    # Locating the Node with nil as their next_node value
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node.next_node = Node.new(value)
  end

  def prepend(value)
    current_head = @head
    @head = Node.new(value)
    @head.next_node = current_head
  end

  def size
    size = 0
    current_node = @head

    until current_node.nil?
      current_node = current_node.next_node
      size += 1
    end

    size
  end

  def tail
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def at(index)
    current_node = @head
    count = 0

    while count < index
      current_node = current_node.next_node
      count += 1
    end

    current_node
  end

  def pop
    current_node = @head
    next_node = current_node.next_node

    until next_node.next_node.nil?
      current_node = next_node
      next_node = next_node.next_node
    end

    current_node.next_node = nil
  end

  def contains(value)
    current_node = @head

    until current_node.nil?
      return true if current_node.value == value
      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    current_node = @head
    count = 0

    until current_node.value == value
      count += 1
      current_node = current_node.next_node
      return current_node if current_node.nil?
    end

    count
  end

  def to_s
    string = ''
    current_node = @head

    until current_node.nil?
      string += "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end

    string += 'nil'
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    return append(value) if index == size
    return nil if index < 0 || index > size

    current_node = at(index)
    preceding_node = at(index - 1)
    new_node = Node.new(value)
    new_node.next_node = current_node
    preceding_node.next_node = new_node
  end

  def remove_at(index)
    return nil if index < 0 || index >= size
    current_node = at(index)
    preceding_node = at(index - 1)

    if !preceding_node.nil?
      preceding_node.next_node = current_node.next_node
    else
      @head = current_node.next_node
    end

    current_node.next_node = nil
  end
end

a = Node.new('a')
list = LinkedList.new(a)
list.append('b')
list.prepend('c')
puts list
list.insert_at('d', 2)
puts list
list.remove_at(2)
puts list
puts "Size of Linked List is #{list.size}"
puts "Head of Linked List is #{list.head.value}"
puts "Tail of Linked List is #{list.tail.value}"
puts "#{list.at(2).value} is in Index 2"
list.pop
puts "Updated Linked List: #{list}"
