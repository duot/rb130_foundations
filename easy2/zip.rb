
def zip a1, a2
  Array.new(a1.size) { |i| [a1[i], a2[i]] }
end



p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
p ([1, 2, 3].zip [4, 5, 6, 7])# == [[1, 4], [2, 5], [3, 6]]