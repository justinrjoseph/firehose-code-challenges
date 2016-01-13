require 'minitest/autorun'

class Collatz

  def initialize(number)
    @number = number
  end
    
  def sequence
    
    @sequence = [@number]
    
    return @sequence if @number == 1
    
    until @sequence.last == 1
      if @sequence.last.even?
        @sequence << @sequence.last / 2
      else
        @sequence << ( 3 * @sequence.last ) + 1
      end
    end
    
    @sequence
    
  end
  
  def sequence_length
    @sequence.count
  end

  def self.longest_sequence(range)
    
    h = Hash.new
    
    range.each { |number| calculate_sequence_cache h, number }
    
    h.invert[h.values.max]
    
  end
  
  def self.calculate_sequence(h, number, steps)
    
    if h[number]
      h[number] + steps - 1
    elsif number == 1
      steps
    elsif number.even?
      calculate_sequence(h, number / 2, steps + 1 )
    else
      calculate_sequence(h, 3 * number + 1, steps + 1 )
    end
    
  end
  
  def self.calculate_sequence_cache(h, number)
    h[number] = calculate_sequence(h, number, 1)
  end

end



class CollatzTest < MiniTest::Test

  def test_collatz_sequence_01
  
    collatz = Collatz.new 1
    
    expected_sequence = [1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 1, collatz.sequence_length
  
  end

  def test_collatz_sequence_02
    
    collatz = Collatz.new 2
    
    expected_sequence = [2, 1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 2, collatz.sequence_length
  
  end

  def test_collatz_sequence_03
    
    collatz = Collatz.new 3
    
    expected_sequence = [3, 10, 5, 16, 8, 4, 2, 1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 8, collatz.sequence_length
  
  end

  def test_collatz_sequence_04
    
    collatz = Collatz.new 4
    
    expected_sequence = [4, 2, 1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 3, collatz.sequence_length
  
  end
  
  def test_collatz_sequence_05
    
    collatz = Collatz.new 5
    
    expected_sequence = [5, 16, 8, 4, 2, 1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 6, collatz.sequence_length
  
  end
  
  def test_collatz_sequence_06
    
    collatz = Collatz.new 6
    
    expected_sequence = [6, 3, 10, 5, 16, 8, 4, 2, 1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 9, collatz.sequence_length
  
  end
  
  def test_collatz_sequence_07
    
    collatz = Collatz.new 7
    
    expected_sequence = [7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 17, collatz.sequence_length
  
  end
  
  def test_collatz_sequence_08
    
    collatz = Collatz.new 8
    
    expected_sequence = [8, 4, 2, 1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 4, collatz.sequence_length
  
  end
  
  def test_collatz_sequence_09
    
    collatz = Collatz.new 9
    
    expected_sequence = [9, 28, 14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 20, collatz.sequence_length
  
  end
  
  def test_collatz_sequence_10
    
    collatz = Collatz.new 10
    
    expected_sequence = [10, 5, 16, 8, 4, 2, 1]

    assert_equal expected_sequence, collatz.sequence
    
    assert_equal 7, collatz.sequence_length
  
  end
  
  def test_longest_collatz_sequence
  
    assert_equal 837799, Collatz.longest_sequence((1..1000000))
  
  end

end