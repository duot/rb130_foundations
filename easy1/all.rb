#require_relative 'any.rb'

def all?(coll)
  if block_given?
    coll.each { |elem| return false unless yield elem }
  else
    coll.each { |elem| return false unless elem }
  end
  return true

  #check = proc { |elem| return false  unless elem }
end

def _all?(coll)
  any?(coll) { |elem| !!!elem }
end

def _all?(coll)
  coll.each do |elem|
    unless yield elem || elem
      return false
    end
  end
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true

p all?([]) == true
p all?([1]) == true
p all?([nil]) == false
