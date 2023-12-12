one_input = File.new("./1_input.txt")


result = 0

one_input.each_line do |line|
  nums = line.scan(/\d/) #=> returns an array of every single integer in the string using Regex
  result += (nums[0] + nums[-1]).to_i
end

puts "Result: #{result}"
