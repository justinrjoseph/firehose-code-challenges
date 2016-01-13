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
  
  def reverse_list
      
    list = self
    previous_node = nil

    while list
      previous_next_node = list.next_node
      list.next_node = previous_node
      previous_node = list
      list = previous_next_node
    end

    reversed_list = previous_node
  
  end
  
  def infinite?
    slow = fast = self
    
    while slow = slow.next_node
      
      if _next = fast.next_node
        fast = _next.next_node
      else
        return false
      end
      
      return true if slow == fast

    end
  end

end



class LinkedListTest < MiniTest::Test

  def test_reverse_linked_list_via_iteration_01
      
    node_1 = LinkedListNode.new 37
    node_2 = LinkedListNode.new 99, node_1
    node_3 = LinkedListNode.new 12, node_2
    
    expected_output = "12 --> 99 --> 37 --> nil\n"
    
    assert_equal expected_output, node_3.print_values
    
    reversed_list = node_3.reverse_list
    
    expected_output = "37 --> 99 --> 12 --> nil\n"
    
    assert_equal expected_output, reversed_list.print_values
    
  end

  def test_reverse_linked_list_via_iteration_02
      
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
  
  def test_linked_list_is_not_infinite
      
    node_1 = LinkedListNode.new 37
    node_2 = LinkedListNode.new 99, node_1
    list = LinkedListNode.new 12, node_2
    
    refute list.infinite?
    
  end
  
  def test_linked_list_is_infinite
      
    node_1 = LinkedListNode.new 37
    node_2 = LinkedListNode.new 99, node_1
    list = LinkedListNode.new 12, node_2
    node_1.next_node = list
    
    assert list.infinite?
    
  end

end