require_relative 'lib/tree'
require_relative 'lib/node'

# testing methods

a = Array.new(15) { rand(1..100) }

# Create a BST from an array of random numbers
tree = Tree.new(a)
tree.pretty_print

# Confirm the tree is balanced
puts "\nTree Balanced? #{tree.balanced?}\n"


# Print out all elements in Level, pre-, post, and in order:
puts 'Level Order'
puts "#{tree.level_order}"
puts ''
puts 'Preorder'
puts "#{tree.preorder}"
puts ''
puts 'Postorder'
puts "#{tree.postorder}"
puts ''
puts 'Inorder'
puts "#{tree.inorder}"
puts ''

# Unbalance the tree by adding several numbers > 100
tree.insert(101)
tree.insert(102)
tree.insert(420)
tree.insert(6969)

# Confirm the tree is unbalanced
puts "\nTree Balanced? #{tree.balanced?}\n"


# Balance the tree
tree.rebalance
tree.pretty_print

# Confirm the tree is balanced
puts "\nTree Balanced? #{tree.balanced?}\n"


# Print out all elements in Level, pre-, post, and in order:
puts ''
puts 'Level Order'
puts "#{tree.level_order}"
puts ''
puts 'Preorder'
puts "#{tree.preorder}"
puts ''
puts 'Postorder'
puts "#{tree.postorder}"
puts ''
puts 'Inorder'
puts "#{tree.inorder}"
puts ''
