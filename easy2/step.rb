require 'pry'

def step(start, to, stp)
  i = start
  while i < to.next
    yield i
    i += stp
  end
end

def step start, stop, step, &block
  steps = (start..stop).each_slice(step).map &:first
  steps.map &block
end

def step start, stop, step, &block
  start.step(to: stop, by: step).each &block
end

v = step 1, 10, 3 do |val| puts "value = #{val}"; true end
p v
