class Queue
    def initialize
        @container=[]
        @head=nil
    end

    def add_value value
        if @head.nil?
            @head=value
        end
        @container.push(value)
    end

    def remove
        @container.shift
        @head=@container[0]
    end

    def show_container
        @container.join(" ")
    end

    def empty?
        @head.nil?
    end

    def peek
        @head
    end
end
