#frozen_string_literal: True

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

  def insert(value)
  end

  def delete(value)
  end

  # def find(value, node = @root)
  #   return 'Value not present' if node.nil?

  #   return node if node.data == value

  #   node.data > value ? find(value, node.left) : find(value, node.right)

  # end

  def find(value)
    node = @root

    while node
      return node if node.data == value

      node = node.left if value < node.data
      node = node.right if value > node.data
    end
    "value not present"
  end

  def level_order
  end

  def inorder
  end

  def preorder
  end

  def postorder
  end

  def height(node)
    return height
  end

  def depth(node)
    return depth
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
