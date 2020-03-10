require 'pry'

# return sorted ar of missing numbers
def missing(sar)
  all_num = (sar[0]..sar[-1]).to_a
  all_num - sar
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

