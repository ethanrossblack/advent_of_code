def red_possible(game_record)
  red_draws = game_record.scan(/(?:\d+ red)/)
  
  possible = true
  
  red_count = 0

  red_draws.each do |draw|
    reds_drawn = /\d+/.match(draw)[0].to_i
    
    if reds_drawn > 12
      possible = false
    end
  end
  
  possible
end

def blue_possible(game_record)
  blue_draws = game_record.scan(/(?:\d+ blue)/)

  possible = true
  
  blue_draws.each do |draw|
    blues_drawn = /\d+/.match(draw)[0].to_i
    
    if blues_drawn > 14
      possible = false
    end
  end
  
  possible
end

def green_possible(game_record)
  green_draws = game_record.scan(/(?:\d+ green)/)
  
  possible = true

  green_draws.each do |draw|
    greens_drawn = /\d+/.match(draw)[0].to_i
    
    if greens_drawn > 13
      possible = false
    end
  end
  
  possible
end


day2_input = File.new("./2_input.txt")

id_sum = 0
game_id = 0

day2_input.each_line do |game_record|
  game_id += 1
  red_possible = red_possible(game_record) 
  blue_possible = blue_possible(game_record) 
  green_possible = green_possible(game_record)

  if red_possible && blue_possible && green_possible
    puts "Game #{game_id} works!"

    id_sum += game_id

    puts "Current ID_SUM: #{id_sum}\n"
  end
end

puts id_sum