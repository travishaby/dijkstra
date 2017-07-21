require_relative 'test_helper.rb'

describe Vertex do
  it "has a name" do
    vertex = Vertex.new('a')
    expect(vertex.name).must_equal 'a'
  end
end
