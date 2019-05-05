#!/usr/bin/env ruby
# Tells if input number is prime

class PrimeChecker
  def self.first_primes
    [2,3,5,7,11,13,17,19,23,29]
  end
  
  def initialize(input)
    @input = input.gsub(',','')
    exit unless self.integer?
    @number = @input.to_i
  end
  
  def integer?
    Integer(@input); true
  rescue ArgumentError
    puts "'#{@input}' is not an integer.  Try again."; false
  end

  def first_checks
    return_true if PrimeChecker.first_primes.include? @number
    return_false('it is an even number.') if @number%2 == 0
    PrimeChecker.first_primes.each do |p|
      return_false("it is divisible by #{p}.") if @number%p == 0
    end
  end
  
  def iterative_checks
    low = PrimeChecker.first_primes.last + 2
    high = @number - 2
    range = (low..high).to_a
    range.each do |n|
      return_false("it is divisible by #{n}.") if @number%n == 0
    end
  end
    
  def return_true
    puts "#{@input} is a prime number!"
    exit
  end
  
  def return_false(msg)
    puts "#{@input} is not prime: #{msg}"
    exit
  end
end

# Main
if ARGV.empty?
  print 'Enter an integer to see if it is prime: '
  input = gets.chomp
else
  input = ARGV[0]
end
checker = PrimeChecker.new(input)
checker.first_checks
checker.iterative_checks
checker.return_true
