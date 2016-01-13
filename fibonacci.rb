require 'benchmark'

class Fibonacci
    
  def initialize(number)
    @number = number
  end

  def recursive(number = @number)
    
    return number if number < 2
    
    recursive( number - 1 ) + recursive( number - 2 )
    
  end

  def iterative
    
    numbers = [0, 1]

    return @number if @number < 2
    
    (2..@number).each { |n| numbers << numbers[n - 1] + numbers[n - 2] }
    
    numbers.last
    
  end

end



Benchmark.bm do |x|
  fibonacci = Fibonacci.new 35
  x.report("recursive") { fibonacci.recursive }
  x.report("iterative") { fibonacci.iterative }
end