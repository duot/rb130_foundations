require 'benchmark'
require 'pry'

def each_cons coll, &_
  a, b, *rest = coll

  while b
    yield a, b
    a = b
    b, *rest = rest
  end
end
# 37.552988   0.123961  37.676949 ( 37.691728)

def each_cons coll, &block
  return unless coll[1]
  yield coll[0], coll[1]
  each_cons coll[1..-1], &block
end
#  11.890361   0.000070  11.890431 ( 11.890686)

def each_cons coll, &block
  a, *rest = coll
  return unless rest[0]
  yield a, rest[0]
  each_cons rest, &block
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil

def ref_each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
  nil
end

#hash = {}
#arr = (1..1000).to_a
#puts Benchmark.measure {
#  50000.times do
#    ref_each_cons arr do |a, b|
#      hash[a] = b
#    end
#  end
#}
#  7.789094   0.000147   7.789241 (  7.789729)

hash = {}
arr = (1..1000).to_a
puts Benchmark.measure {
  50000.times do
    each_cons arr do |a, b|
      hash[a] = b
    end
  end
}

