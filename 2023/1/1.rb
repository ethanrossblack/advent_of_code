
one_input = File.new("./1_input.txt")


p1_result = 0

# one_input.each_line do |line|
#   nums = line.scan(/\d/) #=> returns an array of every single integer in the string using Regex
#   p1_result += (nums[0] + nums[-1]).to_i
# end

p2_result = 0
line_counter = 0

number_mapping = {
  "one"=>"1",
  "two"=>"2",
  "three"=>"3",
  "four"=>"4",
  "five"=>"5",
  "six"=>"6",
  "seven"=>"7",
  "eight"=>"8",
  "nine"=>"9"
}

one_input.each_line do |line|
  line_counter += 1
  # nums = line.scan(/(?:\d|one|two|three|four|five|six|seven|eight|nine)/) >>> This originally didn't work because it couldn't capture overlapping spelling like "oneight" or "twone", so I got a wrong answer.
  # I figured it out with this https://stackoverflow.com/questions/41028602/find-overlapping-regexp-matches
  nums = line.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten
  nums = nums.map do |num|
    number_mapping[num] || num
  end

  calibration = (nums[0] + nums[-1]).to_i
  p2_result += calibration
  
  # puts "Line #{line_counter}: #{line.strip}"
  # puts "Nums: #{nums}"
  # puts "Calibration: #{calibration}"
  # puts "p2_result: #{p2_result}",""

end

puts "Part2 Result: #{p2_result}"

