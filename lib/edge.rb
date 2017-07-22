class Edge
  attr_reader :start, :terminus, :length
  def initialize(start:, terminus:, length:)
    @start = start
    @terminus = terminus
    @length = length
  end

  def <=>(comparison_edge)
    length <=> comparison_edge.length
  end
end
