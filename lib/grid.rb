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

    start_i = [0, i - 1].max
    end_i = [grid.row_size - 1, i + 1].min

    start_j = [0, j - 1].max
    end_j = [grid.column_size - 1, j + 1].min

    start_i.upto(end_i) do |i|
      start_j.upto(end_j) do |j|
        cell = [i, j]
        neighbours << cell unless visited.include?(cell)
      end
    end

    neighbours
  end

  def assemble_word(visited)
    visited.map { |(i, j)| grid[i, j] }.join
  end
end
