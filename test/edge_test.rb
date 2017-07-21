require_relative 'test_helper.rb'

describe Edge do
  it "has a start vertex, terminus vertex, and a distance" do
    vertex_a = Vertex.new('a')
    vertex_b = Vertex.new('b')
    edge = Edge.new(start: vertex_a, terminus: vertex_b, length: 5)

    expect(edge.start).must_equal vertex_a
    expect(edge.terminus).must_equal vertex_b
    expect(edge.length).must_equal 5
  end
end
