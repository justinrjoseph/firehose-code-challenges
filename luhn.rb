require 'minitest/autorun'

class Luhn
    
  def initialize(number)
    @number = number
  end
  
  def is_valid?
    
    reversed_number = @number.to_s.reverse.chars.map(&:to_i)
    
    processed_number = reversed_number.each_with_index.map do |digit, i|
        if i.odd?
            digit *= 2
            digit >= 10 ? digit -= 9 : digit
        else
            digit
        end
    end
    
    processed_number.inject { |sum, number| sum + number } % 10 == 0
  
  end
  
end



class CreditCardTest < MiniTest::Test

  def test_credit_card_valid_01
    
    credit_card = Luhn.new 4194560385008504
    
    assert credit_card.is_valid?
    
  end

  def test_credit_card_invalid_01
    
    credit_card = Luhn.new 4194560385008505
    
    refute credit_card.is_valid?
    
  end

  def test_credit_card_valid_02
    
    credit_card = Luhn.new 377681478627336
    
    assert credit_card.is_valid?, "Check step two: Did you start at the right?"
    
  end

  def test_credit_card_invalid_02
    
    credit_card = Luhn.new 377681478627337
    
    refute credit_card.is_valid?, "Check step two: Did you start at the right?"
    
  end

end