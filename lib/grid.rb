require 'matrix'

class Grid
  def initialize(cells)
    @grid = Matrix[*cells]
  end

  def words
    w = []
    grid.each_with_index do |_, i, j|
      w += f([[i, j]])
    end
    w
  end

  private

  attr_reader :grid

  def f(visited)
    current_cell = visited.last
    neighbours = visitable_neighbours(current_cell, visited)

    [assemble_word(visited)] +
      neighbours.reduce([]) do |words, cell|
        words + f(visited.dup << cell)
      end
  end

  def visitable_neighbours(cell, visited)
    i, j = cell

    neighbours = []

    (i - 1).upto(i + 1) do |i|
      next if i < 0 || grid.row_size == i

      (j - 1).upto(j + 1) do |j|
        next if j < 0 || grid.column_size == j

        cell = [i, j]

        next if visited.include?(cell)

        neighbours << cell
      end
    end

    neighbours
  end

  def assemble_word(visited)
    visited.map { |(i, j)| grid[i, j] }.join
  end
end
