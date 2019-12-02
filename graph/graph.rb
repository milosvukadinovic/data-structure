require_relative('./vertex.rb')
require_relative('./../queue-array/queue.rb')

# The Adjacent list Graph
class Graph
  attr_accessor :vertices, :adjList, :edges

  # initializing the graph with the number of vertices that we will have
  def initialize(v)
    @vertices = v
    @edges = 0
    @adjList = Array.new(v)

    # create a list for each vertex
    @adjList.each_index do |index|
      @adjList[index] = []
    end
  end

  # adds an edge to a un directed graph
  def add_edge(src, dest)
    # add a edge to the head
    @adjList[src] << dest
    # since this graph is not directed we need to do the oposite also
    #  @adjList[dest] << src
    @edges += 1
  end

  def print_graph
    @adjList.each_with_index do |_item, index|
      print "Vertex [#{index}]"

      @adjList[index].each do |item|
        print " -> #{item}"
      end

      puts
    end
  end

  # BFS traversal from a given source
  # @return [nil]
  def breadth_first_traverse(s)
    a = []
    # marking visited nodes
    visited = Array.new(@vertices)
    # create a queue for BFS
    queue = Queue.new

    # mark the current node as visited and enqueue it
    visited[s] = true
    queue.enqueue(s)

    until queue.empty?

      # Dequeue a vertex from queue and print it or push it into 'a' array
      s = queue.poll

      # print "#{s} "
      a.push(s)

      # get all adjacent vertices of the dequeued vertex s
      # if a adjacent has not been visited, then mark it
      # visited and dequeue it
      adjacent_vertices = @adjList[s]

      i = 0
      while i < adjacent_vertices.length

        n = adjacent_vertices[i]

        unless visited[n]
          visited[n] = true
          queue.enqueue(n)
        end

        i += 1
      end

    end
    # returning the list on BFS order
    a
  end

  # DFS traversal implemnetation
  def depth_first(starting_vertex)
    visited = []

    depth_first_recursion(starting_vertex, visited)
  end

  def component?
    visited = Array.new(@vertices, false)

    i = 0
    counter = 0

    while i < visited.length
      unless visited[i]
        depth_first_recursion(i, visited)
        counter += 1
      end
      i += 1
    end

    if counter > 1
      return false
    else
      return true
    end
  end

  def cycle?
    return true if (@edges / 2).to_i >= @vertices

    false
  end

  private

  # The recursive function used by DFS
  def depth_first_recursion(v, visited)
    # Mark the current node as visited and print it
    visited[v] = true
    # print v.to_s + ' '

    head = @adjList[v]

    head.each_index do |index|
      n = head[index]
      depth_first_recursion(n, visited) unless visited[n]
    end
  end

  def self.hash_to_graph(hash)
    gr = Graph.new(hash.keys.size)

    hash.each do |key, value|
      value.each do |element|
        gr.add_edge(key, element)
      end
    end
    gr
  end
end

# boilerplate code

def graph_cycle?(hash_graph)
  # write your code here

  graph = Graph.hash_to_graph(hash_graph)
  graph.has_cycle?
end
