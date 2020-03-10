def map coll
  Array.new coll.size do |idx| yield coll[idx] end
end

def map coll
  acc = []
  for elem in coll do acc << yield(elem) end
  acc
end

def map coll
  acc = Array.new coll.size
  acc.each_with_index do |elem, i|
    acc[i] = yield coll[i]
  end
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

h = {a: 1, b:2}
map h do |(k, v)| p k, v end
