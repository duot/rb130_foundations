class Tree
  include Enumerable

  def <=>(other)
    0
  end

  def each
    yield
  end
end

t = Tree.new
t2 = Tree.new
ar = t, t2
ar.sort

