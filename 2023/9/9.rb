=begin
  1   3   6  10  15  21
    2   3   4   5   6
      1   1   1   1
        0   0   0
=end

require "pry"

def next_sequence(nums)
  diff_array = []

  1.upto(nums.length - 1) do |i|
    diff_array << nums[i] - nums[i - 1]
  end

  diff_array
end

def all_sequences(nums)
  all_sequences = []
  holder = nums

  all_sequences << nums

  until holder == Array.new(holder.length, 0)
    holder = next_sequence(holder)
    all_sequences << holder
  end

  all_sequences
end

def next_value(nums)
  nums = all_sequences(nums)
  steps = nums.length

  (steps - 1).downto(1) do |i|
    nums[i - 1] << nums[i][-1] + nums[i - 1][-1]
  end

  nums[0][-1]
end

def previous_value(nums)
  nums = all_sequences(nums)
  steps = nums.length

  (steps - 1).downto(1) do |i|
    nums[i - 1].unshift(nums[i-1][0] - nums[i][0])
  end

  nums[0][0]
end

# Read each line of the input, turn it into an array, and add "next_value(line)" to a variable
# return the variable

nine_input = File.new("./9_input.txt")

return_value = 0

nine_input.each_line do |line|
  line = line.split.map(&:to_i)
  return_value += next_value(line)
end

puts "Part 1 Answer: #{return_value}" # 2098530125