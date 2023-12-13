def necessary_cubes(game_record, color)
  cube_draws = game_record.scan(/(?:\d+ #{color})/)
  
  cube_draws = cube_draws.map do |draw|
    /\d+/.match(draw)[0].to_i
  end
  
  cube_draws.max
end

day2_input = File.new("./2_input.txt")

power_sum = 0

day2_input.each_line do |game_record|
  red = necessary_cubes(game_record, "red")
  blue = necessary_cubes(game_record, "blue")
  green = necessary_cubes(game_record, "green")

  power_sum += red * blue * green
end

puts power_sum #=> 66027