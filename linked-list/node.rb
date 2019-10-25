class Node
    attr_reader :value
    attr_accessor :next , :prev_node
  
    def initialize(value, next_node=nil, prev_node=nil)
        @value = value
        @next = next_node
        @prev_node= prev_node
    end

  end
