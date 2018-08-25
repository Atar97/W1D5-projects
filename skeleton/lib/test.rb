require_relative '00_tree_node'
require_relative'knight_path'
knight1 = KnightPathFinder.new([0,0])
knight1.move_tree([0,0])
puts knight1.to_s
puts "\n\n\n\n\n"
print  "#{knight1.trace_path_back([2,1])}\n"
print  "#{knight1.trace_path_back([3,3])}\n"
print  "#{knight1.trace_path_back([7,2])}\n"
print  "#{knight1.trace_path_back([4,5])}\n"
