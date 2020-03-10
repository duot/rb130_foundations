
class Thing
  def each
    yield "a"
    yield "b"
    :result
  end
end

Thing.include Enumerable
t = Thing.new.lazy

p t.next
p t.next
p t.next rescue nil

t = Thing.new.to_enum
p t.next
p t.next
p t.next rescue nil

t = Thing.new.to_enum
p loop { p t.next }

t = Thing.new.to_enum.with_index { |item, idx| puts item: item, index: idx }

