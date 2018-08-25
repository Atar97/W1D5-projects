require_relative '00_tree_node'
require 'byebug'
class KnightPathFinder
  attr_reader :visited_position, :root

  def initialize(pos)
    @visited_position = [pos]
    @root = nil
  end

  def self.root_node(pos)
    PolyTreeNode.new(pos)
  end

  def self.valid_move(pos)
    moves_array = [[2,1],[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]]
    result = []
    moves_array.each do |move|
      x_pos = pos[0] + move[0]
      if (0..7).include?(x_pos)
        y_pos = pos[1] + move[1]
        if (0..7).include?(y_pos)
          result << [x_pos, y_pos]
        end
      end
    end
    result
  end

  def to_s
    "#{@root.to_s} Visted = #{@visited_position}"
  end

  def new_move_position(pos_now)
    all_moves = KnightPathFinder.valid_move(pos_now)
    all_moves.reject! {|move| @visited_position.include?(move)}
    @visited_position.concat(all_moves)
    all_moves
  end

  def build_move_tree
      # debugger
    queue = [PolyTreeNode.new(@visited_position[0])]

    until queue.empty?
      parent = queue.shift
      @root ||= parent
      all_moves = new_move_position(parent.value)
      all_moves.each do |move|
        child = PolyTreeNode.new(move)
        child.parent = parent
        queue << child
      end
    end
    @root
  end

  def find_dfs(target_pos)
    @root.dfs(target_pos)
  end

  def find_bfs(target_pos)
    @root.bfs(target_pos)
  end


  def trace_path_back(end_pos)
    end_node = most_efficient_search(end_pos)
    result = [end_node.value]
    until end_node == @root
      end_node = end_node.parent
      result.unshift(end_node.value)
    end
    result
  end

  private

  def self.use_bfs?(start_pos, end_pos)
    difference = (start_pos[0] - end_pos[0]).abs
    difference += (start_pos[1] - end_pos[1]).abs
    difference < 8
  end

  def most_efficient_search(end_pos)
    if KnightPathFinder.use_bfs?(@root.value, end_pos)
      self.find_bfs(end_pos)
    else
      self.find_dfs(end_pos)
    end
  end

end
