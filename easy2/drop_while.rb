def drop_while arr, &block
  acc = arr
  arr.each do |elem|
    break acc unless yield elem
    acc.shift
  end
end

def drop_while arr
  _, *arr = arr until !yield(arr.first) || arr.empty?
  arr
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? }
p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
