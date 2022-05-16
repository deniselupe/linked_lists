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
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def append(value)
    current_node = @root

    # Location the Node with nil as their next_node value
    while current_node.next_node != nil
      current_node = current_node.next_node
    end

    current_node.next_node = Node.new(value)
  end

  def prepend(value)
    current_head = @root
    @root = Node.new(value)
    @root.next_node = current_head
  end
end

a = Node.new('a')
list = LinkedList.new(a)
list.append('b')
list.prepend('c')
p list.root
