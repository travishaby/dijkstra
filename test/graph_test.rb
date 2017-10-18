require_relative 'test_helper.rb'

describe Graph do
  let(:a) { Vertex.new('a') }
  let(:b) { Vertex.new('b') }
  let(:c) { Vertex.new('c') }
  let(:d) { Vertex.new('d') }
  describe 'vertices' do
    it 'can have many vertices' do
      graph = Graph.new
      a = Vertex.new('a')
      b = Vertex.new('b')
      graph.add_vertex(a)
      graph.add_vertex(b)

      expect(graph.vertices).must_equal [a, b]
    end
    it 'yells if you try to add the same vertex twice' do
      graph = Graph.new
      a = Vertex.new('a')
      graph.add_vertex(a)

      assert_raises RuntimeError do
        graph.add_vertex(a)
      end
    end
  end
  describe 'edges' do
    let(:graph) { Graph.new }
    let(:edge1) { Edge.new(start: a, terminus: b, length: 3) }
    let(:edge2) { Edge.new(start: a, terminus: c, length: 4) }

    before do
      graph.add_vertex(a)
      graph.add_vertex(b)
      graph.add_vertex(c)
    end

    it 'can have many edges' do
      graph.add_edge(edge1)
      graph.add_edge(edge2)
      expect(graph.edges).must_equal [edge1, edge2]
    end
    it 'yells if you try to add the same edge twice' do
      graph.add_edge(edge1)

      assert_raises RuntimeError do
        graph.add_edge(edge1)
      end
    end
  end
  describe '#find_shortest_path_from_vertex' do
    let(:graph) { Graph.new }
    let(:edge1) { Edge.new(start: a, terminus: b, length: 3) }
    let(:edge2) { Edge.new(start: a, terminus: c, length: 4) }
    let(:edge3) { Edge.new(start: a, terminus: d, length: 6) }

    before do
      graph.add_vertex(a)
      graph.add_vertex(b)
      graph.add_vertex(c)
      graph.add_edge(edge1)
      graph.add_edge(edge2)
      graph.add_edge(edge3)
    end

    it 'can find edges connected to a given vertex' do
      expect(graph.find_connected_edges(a)).must_equal [edge1, edge2, edge3]
    end

    it 'can find the shortest connected edge' do
      expect(graph.find_shortest_edge(a)).must_equal edge1
    end
  end
  describe '#dijkstra' do
    let(:graph) { Graph.new }
    let(:e) { Vertex.new('e') }
    let(:f) { Vertex.new('f') }
    let(:g) { Vertex.new('g') }
    let(:edge1) { Edge.new(start: a, terminus: b, length: 3) }
    let(:edge2) { Edge.new(start: a, terminus: c, length: 4) }
    let(:edge3) { Edge.new(start: a, terminus: d, length: 6) }
    let(:edge4) { Edge.new(start: b, terminus: e, length: 3) }
    let(:edge5) { Edge.new(start: d, terminus: e, length: 8) }
    let(:edge6) { Edge.new(start: d, terminus: f, length: 10) }
    let(:edge7) { Edge.new(start: f, terminus: g, length: 7) }
    let(:edge8) { Edge.new(start: e, terminus: g, length: 5) }

    before do
      graph.add_vertex(a)
      graph.add_vertex(b)
      graph.add_vertex(c)
      graph.add_vertex(d)
      graph.add_vertex(e)
      graph.add_vertex(f)
      graph.add_vertex(g)
      graph.add_edge(edge1)
      graph.add_edge(edge2)
      graph.add_edge(edge3)
      graph.add_edge(edge4)
      graph.add_edge(edge5)
      graph.add_edge(edge6)
      graph.add_edge(edge7)
      graph.add_edge(edge8)
    end
    it 'does the thing' do
      result = graph.dijkstra(a, g)
      expect(result).must_equal 11
    end
  end
end
