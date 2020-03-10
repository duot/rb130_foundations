require 'pry'
require 'benchmark'

def max_by coll, &block
  coll.sort_by(&block).last
end

#  1.364469   0.775915   2.140384 (  2.142644)
def max_by coll
  max, item, *coll = coll
  while item
    max = item if yield(max) < yield(item)
    _, item, *coll = coll
  end
  max
end

#   1.597166   0.796016   2.393182 (  2.393703) 
def max_by coll
  coll.reduce(coll[0]) { |max, elem| yield(max) < yield(elem) ? elem : max }
end

# 1.427470   0.000001   1.427471 (  1.427349) 
#   1.431267   0.767463   2.198730 (  2.199123)
def max_by coll
  return if coll.empty?
  max, *rest = coll
  max_v = yield max
  rest.each do |item|
    item_v = yield item
    max, max_v = item, item_v if max_v < item_v
  end
  max
end
# 1.190696   0.000012   1.190708 (  1.190412)
#   1.383166   0.772229   2.155395 (  2.155421)
def _max_by coll
  return if coll.empty?

  max, item, *rest = coll
  max_v = yield max
  while item
    item_v = yield item
    max, max_v = item, item_v if max_v < item_v
    _, item, *rest = rest
  end
  max
end

def action
max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
max_by([]) { |value| value + 5 } == nil
end

def bench
  start = p Time.now
  1000.times { action }
  fin = p Time.now
  p fin - start
end

#bench

puts Benchmark.measure {
  500000.times do
    action
  end
}
