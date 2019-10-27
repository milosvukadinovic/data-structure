require_relative 'node'

class LinkedList
      attr_accessor :head, :tail
    def initialize
      @head = nil
      @tail=nil
    end

    def add_to_back(value)
      node= Node.new(value)
      if @head.nil?
        @head=node
        @tail=node
      else
        pre=@tail
        @tail.next_node = node
      @tail=node
      @tail.prev_node=pre
      end
  end

  def add_to_front(value)
    node=Node.new(value,@head)
    unless @head.nil?
      @head.prev_node=node
    end
    if @tail.nil?
      @tail=node
    end
    
    @head=node
  end

  def return_list
    return "empty" if @head.nil?

    elements = []
    current_node = @head
    
    while current_node.next_node != nil
      elements << current_node.value
      current_node = current_node.next_node
    end

    elements << current_node.value
    return elements.join(" ")
  end
  
  def remove_front
    return nil if @head.nil?
  
    if @head.next_node.nil?
      @tail=nil
  end
    deleted_node=@head
    @head=@head.next_node
    
  deleted_node
  end
  
  def remove_back
    return nil if @tail.nil?
  
    if @tail.previous.nil?
      @head=nil
  end
  deleted_node=@tail
    @tail=@tail.previous
  
     deleted_node
  end
  
  def remove_first(value)
    return nil if @head.nil?
  
  current_node = @head
  index = 0
  until current_node.nil?
    if current_node.value == value
    remove_at_index(index)
  return current_node
  end
    current = current.next_node
    index =+ 1
    end
  end
  
  def remove_at_index(index)
  end
  
  def remove_all(value)
  return nil if @head.nil?
  
  current_node=@head
  
  until current_node.nil?
    if current_node==value
      unless current_node.prev_node.nil?
        current_node.prev_node.next_node = current_node.next_node
  else
    current.next_node.prev_node = nil
    @head = current_node.next_node
      end
      unless current_node.next_node.nil?
        current_node.next_node.prev_node=current_node.prev_node
      else
  		current_node.prev_node.next_node = nil
        @tail = current_node.prev_node
  end
      
    end
    end
    return nil
  end
end

  
