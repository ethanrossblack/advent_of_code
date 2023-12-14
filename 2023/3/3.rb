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
end



