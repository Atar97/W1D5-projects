require_relative '00_tree_node'
require_relative'knight_path'
knight1 = KnightPathFinder.new([0,0])
knight1.move_tree([0,0])
puts knight1.to_s
puts "\n\n\n\n\n"
puts knight1.find_node_dfs([4,6])
puts knight1.find_node_bfs([1,6])
