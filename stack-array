class Stack
    def initialize
        @container=[]
        @last=nil
    end

    def add_value value
        @last=value
        @container.push(value)
    end

    def remove
        @container.pop
        @last=@container[@container.length-1]
    end

    def show_container
        @container.join(" ")
    end

    def empty?
        @last.nil?
    end

    def peek
        return @last.nil? ? "empty" : @last
    end
end
