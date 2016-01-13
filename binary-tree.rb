require 'minitest/autorun'

class BinaryTree
  
  attr_accessor :payload, :left, :right

  def initialize(values = {})
    @payload = values[:payload]
    @left = values[:left]
    @right = values[:right]
  end

  def build_from_array(array, btree = self)
    
    return array if array.nil? || array.empty?
    
    btree.payload = array.shift
    
    add_node array.shift until array.count == 0
    
    btree

  end
  
  def get_sorted_array(node = self, sorted_array = [])
    
    get_sorted_array node.left, sorted_array unless node.left.nil?
    
    sorted_array << node.payload
    
    get_sorted_array node.right, sorted_array unless node.right.nil?
    
    sorted_array
    
  end

  private
  
    def add_node(new_value)
      
      current_node = self
      placed = false
      
      until placed
        if new_value > current_node.payload
          if current_node.right
            current_node = current_node.right
          else
            current_node.right = BinaryTree.new( { payload: new_value,
                                                   left: nil,
                                                   right: nil } )
            placed = true
          end
        else
          if current_node.left
            current_node = current_node.left
          else
            current_node.left = BinaryTree.new( { payload: new_value,
                                                  left: nil, 
                                                  right: nil } )
            placed = true
          end
        end
      end
    
    end

end



class BinaryTreeTest < MiniTest::Test
  
  def setup
    @btree = BinaryTree.new
  end
  
  def test_binary_tree_sort_01
    
    array = [7, 4, 9, 1, 6, 14, 10]
    
    @btree.build_from_array array
    
    assert_equal [1, 4, 6, 7, 9, 10, 14], @btree.get_sorted_array
    
  end
  
  def test_binary_tree_sort_02
    
    array = [7, 10, 3, 27, 21, 18, 16]
    
    @btree.build_from_array array
    
    assert_equal [3, 7, 10, 16, 18, 21, 27], @btree.get_sorted_array
    
  end
  
  def test_binary_tree_sort_03
    
    array = [16, 44, 95, 2, 57, 21, 89, 30, 77, 62]
    
    @btree.build_from_array array
    
    assert_equal [2, 16, 21, 30, 44, 57, 62, 77, 89, 95], @btree.get_sorted_array
    
  end

end