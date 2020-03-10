def one?(coll)
  coll.count { |e| yield e } == 1
end

def one?(coll)
  count = 0
  coll.each do |e|
    count += 1 if yield e
    return false if count > 1
  end
  count == 1
end

def one? coll
  seen_p = false
  coll.each do |elem|
    next unless yield elem
    return false if seen_p
    seen_p = true
  end
  seen_p
end


p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false
