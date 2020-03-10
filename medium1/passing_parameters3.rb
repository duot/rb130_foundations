items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather items do |*a, b|
puts a.join ', '
puts b
end

puts

require 'pry'

gather items do |a, *b, d|
#binding.pry
  puts a
  puts b.join ', '
  puts d
end

puts 3
gather items do |a, *b|
  puts a
  puts b.join ', '
end

puts
puts 4
gather items do |a, b, c, d|
  andd = "and #{d}"
  puts "#{[a,b,c,andd].join ', '}"
end
