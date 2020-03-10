require 'pry'

def each_with_index ar
  (0...ar.size).each { |i| yield ar[i], i }; ar
end

def each_with_index ar
  0.upto(ar.size.pred) { |i| yield ar[i], i }
  ar
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
