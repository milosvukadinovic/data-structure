class Vertex 
    attr_accessor :key,:src,:dest

    def initialize(key)
        @key = key
        @src = @dest = nil
    end
end
