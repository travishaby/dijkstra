class Edge
  attr_reader :start, :terminus, :length
  def initialize(start:, terminus:, length:)
    @start = start
    @terminus = terminus
    @length = length
  end
end
