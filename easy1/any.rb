def any?(arr, &block)
  return false unless block
  arr.each { |elem| return true if block.call(elem) }
  false
end

def any?(coll, &block)
  if block_given?
    coll.each { |elem| return true if yield elem }
  else
    return true unless coll.empty?
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

p any?([1]) { |value| '' } == true

p any?([1]) == true
p [1].any? == true

p [].any? == false
p any?([]) == false

p any?({a: 1}) { |k, v| v == 1 } == true
