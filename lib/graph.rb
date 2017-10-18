require_relative 'path'

class Graph
  attr_reader :vertices, :edges, :remaining, :current_distances
  def initialize
    @vertices = []
    @edges = []
    @remaining = {}
    @current_distances = {}
  end

  def setup_distances(start)
    vertices.each do |v|
      current_distances[v.id] = Float::INFINITY
      remaining[v.id] = v
    end
    current_distances[start.id] = 0
  end

  def dijkstra(start, finish)
    setup_distances(start)
    current_vertex = start
    while !remaining.empty?
      edges = find_connected_edges(current_vertex)
      edges.each do |e|
        current_distance = current_distances[e.terminus.id]
        next_distance = current_distances[current_vertex.id] + e.length
        if next_distance < current_distance
          current_distances[e.terminus.id] = next_distance
        end
      end
      remaining.delete(current_vertex.id)
      return current_distances[current_vertex.id] if find_shortest_edge(current_vertex).terminus == finish
      current_vertex = edges.min.terminus
    end
  end

  def add_vertex(vertex)
    unless vertices.find { |v| v.name == vertex.name }
      vertices.push(vertex)
    else
      raise 'That vertex already exists in the graph!'
    end
  end

  def add_edge(edge)
    unless edges.include? edge
      edges.push(edge)
    else
      raise 'That edge already exists in the graph!'
    end
  end

  def find_connected_edges(vertex)
    edges.select { |e| e.start == vertex && !e.terminus.nil? }
  end

  def find_shortest_edge(vertex)
    find_connected_edges(vertex).min
  end
end
