#frozen_string_literal: True

# Creating a BST node class to store data and a pointer to a left and right node/subtree

class Node
  attr_accessor :data, :left, :right
  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

end
