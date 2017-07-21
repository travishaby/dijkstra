class Edge
  attr_reader :start, :terminus
  def initialize(start:, terminus:)
    @start = start
    @terminus = terminus
  end
end
