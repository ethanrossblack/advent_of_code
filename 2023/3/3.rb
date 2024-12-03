class EngineSchematic
  attr_reader :grid

  def initialize
    @grid = []
  end

  def import_grid(grid) #grid is a .txt file
    false unless grid.class == File

    grid.each_line do |line|
      @grid << line.strip.split("")
    end
  end

  def sum_part_numbers

  end

  private

  def find_numbers(row)
    numbers = []

    row.each_with_index do |e, i|
      if %w[0 1 2 3 4 5 6 7 8 9].includes(e)
        starting_index = i
        require "pry"; binding.pry
      end
    end
  end
end



