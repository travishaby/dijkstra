class Path
  def initialize
    @path = []
  end

  def push(edge)
    @path.push(edge)
  end

  def length
    @path.reduce(0) { |acc, edge| acc + edge.length }
  end
end
