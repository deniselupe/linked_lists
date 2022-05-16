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
  def initialize(head)
    @head = head
  end

  def append(value)
    current_node = @head

    # Locating the Node with nil as their next_node value
    while current_node.next_node != nil
      current_node = current_node.next_node
    end

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

    while current_node != nil
      current_node = current_node.next_node
      size += 1
    end

    size
  end

  def head
    puts @head.value
  end

  def tail
    current_node = @head

    while current_node.next_node != nil
      current_node = current_node.next_node
    end

    puts current_node.value
  end
end

a = Node.new('a')
list = LinkedList.new(a)
list.append('b')
list.prepend('c')
list.head
list.tail
