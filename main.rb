require_relative 'lib/tree'
require_relative 'lib/node'

# testing methods

a = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(a)

tree.pretty_print

puts tree.find(9)

tree.insert(323)

tree.pretty_print

p tree.inorder

puts tree.height(tree.find(9))
puts tree.depth(tree.find(9))
puts tree.balanced?
tree.rebalance

puts tree.balanced?

tree.delete(67)
tree.pretty_print