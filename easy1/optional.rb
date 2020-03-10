def compute
  v = yield if block_given?
  v ? v : 'Does not compute.'
end

def compute
  return 'Does not compute.' unless block_given?
  yield
end

def compute(arg = nil)
  return 'Does not compute.' unless block_given?
  arg ? yield : yield(arg)
end

def compute(arg = nil)
  return yield(arg) if block_given?
  'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

p compute() { :value }
p compute(3) { |v| v.next }
p compute(3) { |v| v.pred }
