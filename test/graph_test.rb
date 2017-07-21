require_relative 'test_helper.rb'

describe Graph do
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
    let(:a) { Vertex.new('a') }
    let(:b) { Vertex.new('b') }
    let(:c) { Vertex.new('c') }
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
end
