class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  attr_reader :value, :parent
  attr_accessor :children

  def parent=(my_parent)
    @parent.children.delete(self) unless @parent.nil?
    @parent = my_parent

    unless @parent.nil?
      my_parent.children << self unless my_parent.children.include?(self)
    end
  end

  def add_child(child_node)
    self.children << child_node unless self.children.include?(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
      child_node.parent = nil
    else
      raise_error "The child is not in the children"
    end
  end

  def to_s
    "I am:#{self.value} with Children:#{self.children}}"
  end

  def dfs(target)
    return self if target == self.value
    self.children.each do |child|
      result = child.dfs(target)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      node = queue.shift
      return node if node.value == target

      node.children.each do |child|
        queue << child
      end
    end

    nil
  end

  def inspect
    "I am:#{self.value} with Children:#{self.children.map {|child| child.value}}"
  end


end
