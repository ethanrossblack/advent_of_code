ten_input = File.new("./10_input.txt")

grid = []

row_num = 0

starting_index = []

# Iterate through each line and add it to the grid while also finding the starting index of the loop
ten_input.each_line do |line|
  line = line.strip.split("")
  grid << line
  
  if line.include?("S")
    starting_index << row_num           # Y-Index
    starting_index << line.index("S")   # X-Index
  end

  row_num += 1
end

dict = {}
dict[starting_index] = "S"



def check_north(grid, index)
  y = index[0]
  x = index[1]

  y > 0 && ["7","F","|"].include?(grid[y - 1][x])  
end

def check_south(grid, index)
  y = index[0]
  x = index[1]

  require "pry"; binding.pry
  y + 1 < grid.size && ["L","J","|"].include?(grid[y + 1][x])
  
end

def check_east(grid, index)
  y = index[0]
  x = index[1]

  x + 1 < grid[0].size && ["7","J","-"].include?(grid[y][x + 1])
end

def check_west(grid, index)
  y = index[0]
  x = index[1]

  x > 0 && ["L","F","-"].include?(grid[y][x - 1])
end


route_1 = {}
# First value goes north
index_1 = [61,10]
index_1[0] -= 1
prev_index_1 = starting_index
# Previous direction is the direction of the previous tile relative to the current index
prev_direction_1 = "S"



route_2 = {}
index_2 = [61,10]
index_2[1] -= 1
prev_index_2 = starting_index
prev_direction_2 = "E"

until route_1[index_2] || route_2[index_1] do
  puts "i1: #{index_1}"
  puts "i2: #{index_2}",""

  route_1[Array.new(index_1)] = grid[index_1[0]][index_1[1]]
  route_2[Array.new(index_2)] = grid[index_2[0]][index_2[1]]

  current_1 = route_1[index_1]
  current_2 = route_2[index_2]

  prev_index_1 = Array.new(index_1)
  prev_index_2 = Array.new(index_2)

  if prev_direction_1 == "S" #=> If this current tile is coming from below (S -> N)
    if current_1 == "7" #=> Up, turn left
      index_1[1] -= 1
      prev_direction_1 = "E"
    elsif current_1 == "F" #=> Up, turn right
      index_1[1] += 1
      prev_direction_1 = "W"
    elsif current_1 == "|" #=> Up, continue up (direction doesn't change)
      index_1[0] -= 1
    end
  elsif prev_direction_1 == "W" #=> Current tile is coming from the left (W -> E)
    if current_1 == "7" #=> from left, turn down
      index_1[0] += 1
      prev_direction_1 = "N"
    elsif current_1 == "J" #=> from left, turn up
      index_1[0] -= 1
      prev_direction_1 = "S"
    elsif current_1 == "-" #=> from left, continue right
      index_1[1] += 1
    end
  elsif prev_direction_1 == "N" #=> Current tile is coming from above (N -> S)
    if current_1 == "L" #=> from above, to right
      index_1[1] += 1
      prev_direction_1 = "W"
    elsif current_1 == "J" #=> from above, to left
      index_1[1] -= 1
      prev_direction_1 = "E"
    elsif current_1 == "|" #=> from above, continue down
      index_1[0] += 1
    end
  elsif prev_direction_1 == "E" #=> Current tile is coming from right (E -> W)
    if current_1 == "L" #=> from right, to up
      index_1[0] -= 1
      prev_direction_1 = "S"
    elsif current_1 == "F" #=> from right, to down
      index_1[0] += 1
      prev_direction_1 = "N"
    elsif current_1 == "-" #=> from right, continue left
      index_1[1] -= 1
    end
  end


  if prev_direction_2 == "S" #=> If this current tile is coming from below (S -> N)
    if current_2 == "7" #=> Up, turn left
      index_2[1] -= 1
      prev_direction_2 = "E"
    elsif current_2 == "F" #=> Up, turn right
      index_2[1] += 1
      prev_direction_2 = "W"
    elsif current_2 == "|" #=> Up, continue up (direction doesn't change)
      index_2[0] -= 1
    end
  elsif prev_direction_2 == "W" #=> Current tile is coming from the left (W -> E)
    if current_2 == "7" #=> from left, turn down
      index_2[0] += 1
      prev_direction_2 = "N"
    elsif current_2 == "J" #=> from left, turn up
      index_2[0] -= 1
      prev_direction_2 = "S"
    elsif current_2 == "-" #=> from left, continue right
      index_2[1] += 1
    end
  elsif prev_direction_2 == "N" #=> Current tile is coming from above (N -> S)
    if current_2 == "L" #=> from above, to right
      index_2[1] += 1
      prev_direction_2 = "W"
    elsif current_2 == "J" #=> from above, to left
      index_2[1] -= 1
      prev_direction_2 = "E"
    elsif current_2 == "|" #=> from above, continue down
      index_2[0] += 1
    end
  elsif prev_direction_2 == "E" #=> Current tile is coming from right (E -> W)
    if current_2 == "L" #=> from right, to up
      index_2[0] -= 1
      prev_direction_2 = "S"
    elsif current_2 == "F" #=> from right, to down
      index_2[0] += 1
      prev_direction_2 = "N"
    elsif current_2 == "-" #=> from right, continue left
      index_2[1] -= 1
    end
  end
end

puts "Midpoint: #{route_1.keys.size}" #=> 6757
