require_relative 'node.rb'
# Create a Tree class that builds a tree from a sorted array

class Tree

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil if array.empty?

    array = array.sort.uniq
    return Node.new(array[0]) if array.length <= 1

    mid = array.length / 2 
    root = Node.new(array[mid])
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[(mid + 1)..])
    return root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    node.data > value ? node.left = insert(value, node.left) : node.right = insert(value, node.right)
    return node
  end

  def delete(value)
    # TODO
  end

  def find(value, node = @root)
    return nil if node.nil?

    return node if node.data == value

    node.data > value ? find(value, node.left) : find(value, node.right)

  end

  # # interative version of a find method
  # def find(value)
  #   node = @root

  #   while node
  #     return node if node.data == value

  #     if value < node.data
  #       node = node.left 
  #     else
  #       node = node.right 
  #     end
  #   end
  #   "value not present"
  # end

  def level_order(root = @root)
    return if root.nil?
    queue = []
    order = []
    queue.push(root)

    until queue.empty?
      current_node = queue.shift
      block_given? ? yield(current_node.data) : order << current_node.data
      queue << current_node.left unless current_node.left.nil?
      queue << current_node.right unless current_node.right.nil?
    end
    order
  end

  def inorder(root = @root)
    return if root.nil?

    inorder(root.left)
    puts "#{root.data} "
    inorder(root.right)

  end

  def preorder(root = @root)
    return if root.nil?

    puts "#{root.data} "
    preorder(root.left)
    preorder(root.right)
  end

  def postorder(root = @root)
    return if root.nil?

    postorder(root.left)
    postorder(root.right)
    puts "#{root.data} "
  end

  def height(root = @root)
    return -1 if root.nil? || node.nil?

    left_height = height(root.left)
    right_height = height(root.right)

    return [left_height, right_height].max + 1
  end

  def depth(node, root = @root)
    return -1 if root.nil? || node.nil?

    return 0 if node.data == root.data
    return 1 + depth(node, root.left) if node.data < root.data
    return 1 + depth(node, root.right) if node.data > root.data
  end

  def balanced?
  end

  def rebalance
  end

end

# testing methods

a = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(a)

tree.pretty_print

puts tree.find(9)

tree.insert(6)
tree.pretty_print

p tree.level_order

puts tree.height(tree.find(100))
puts tree.depth(tree.find(100))


