class Graph
  attr_reader :vertices, :edges
  def initialize
    @vertices = []
    @edges = []
  end

  def add_vertex(vertex)
    unless @vertices.include? vertex
      @vertices.push(vertex)
    else
      raise 'That vertex already exists in the graph!'
    end
  end

  def add_edge(edge)
    unless @edges.include? edge
      @edges.push(edge)
    else
      raise 'That edge already exists in the graph!'
    end
  end

  def find_shortest_path_from_vertex(vertex)
    @edges.select { |e| e.start == vertex }.min
  end
end
