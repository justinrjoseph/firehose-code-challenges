require 'minitest/autorun'

class LinkedListNode
    
  attr_reader :value
  attr_accessor :next_node
  
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def print_values(list_node = nil, values = "")

    list_node ||= self
    
    values += "#{list_node.value} --> "
    
    if list_node.next_node
      print_values list_node.next_node, values
    else
      values += "nil\n"
    end
                               
  end

  def reverse_list(list = nil)
      
    list ||= self

    stack = Stack.new

    while list
      stack.push list.value
      list = list.next_node
    end
    
    stack.data
  
  end

end

class Stack
    
  attr_reader :data
  
  def initialize
    @data = nil
  end
  
# Push a value onto the stack
  def push(value)
    @data = LinkedListNode.new value, @data
  end
  
# Pop an item off the stack
# Remove the last item that was pushed onto the 
# stack and return the value to the user
  def pop
    @data = @data.next_node
  end
    
end



class LinkedListTest < MiniTest::Test

  def test_reverse_linked_list_via_stack_01
      
    node_1 = LinkedListNode.new 37
    node_2 = LinkedListNode.new 99, node_1
    node_3 = LinkedListNode.new 12, node_2
    
    expected_output = "12 --> 99 --> 37 --> nil\n"
    
    assert_equal expected_output, node_3.print_values
    
    reversed_list = node_3.reverse_list
    
    expected_output = "37 --> 99 --> 12 --> nil\n"
    
    assert_equal expected_output, reversed_list.print_values
    
  end

  def test_reverse_linked_list_via_stack_02
      
    node_1 = LinkedListNode.new 21
    node_2 = LinkedListNode.new 27, node_1
    node_3 = LinkedListNode.new 85, node_2
    node_4 = LinkedListNode.new 80, node_3
    node_5 = LinkedListNode.new 77, node_4
    
    expected_output = "77 --> 80 --> 85 --> 27 --> 21 --> nil\n"
    
    assert_equal expected_output, node_5.print_values
    
    reversed_list = node_5.reverse_list
    
    expected_output = "21 --> 27 --> 85 --> 80 --> 77 --> nil\n"
    
    assert_equal expected_output, reversed_list.print_values
    
  end

end