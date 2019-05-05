#!/usr/bin/env ruby

# Displays multiplication table
# Default 12, enter argument for other

size = ARGV[0] ? ARGV[0].to_i : 12

if size.is_a?(Integer) && size > 0
  [*1..size].each do |multiplicand|
    [*1..size].each do |multiplier|
      product = multiplicand * multiplier
      ("#{size**2}".length+1 - product.to_s.length).times {print " "}
      print "#{product}"
    end
    puts ''
  end
else
  puts 'Enter argument: size of table, must be a whole number.  Exiting.'
end
