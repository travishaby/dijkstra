class Vertex
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def id
    object_id
  end
end
