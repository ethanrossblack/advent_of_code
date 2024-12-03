require "./3"

RSpec.describe "Advent of Code 2023 Day 3: Gear Ratuis" do
  describe "EngineSchematic class" do
    describe "initialize" do
      it "exists and starts with an empty grid attribute" do
        schematic = EngineSchematic.new
        empty_starter_grid = []
        
        expect(schematic.class).to eq(EngineSchematic)
        expect(schematic.grid).to eq(empty_starter_grid)
        
      end
    end
    
    describe "#import_grid" do
      it "can import a grid from a valid .txt file" do
        schematic = EngineSchematic.new
        input_data = File.new("./test_input.txt")
        
        expect(schematic.grid).to eq([])
        
        expect(schematic.grid).to be_an Array
        expect(schematic.grid).to be_empty
        
        schematic.import_grid(input_data)
        
        expect(schematic.grid).to be_an Array
        expect(schematic.grid).to_not be_empty
      end
    end

    describe "#sum_part_numbers" do
      it "returns the sum of all of the valid part numbers" do
        schematic = EngineSchematic.new
        schematic.import_grid(File.new("./test_input.txt"))

        expect(schematic.sum_part_numbers).to eq(4361)
      end
    end
  end
end