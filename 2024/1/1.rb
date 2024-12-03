
input = File.open("1_input.txt")

left = []
right = []

##########
# PART ONE
##########
# input.each do |line|
#   split = line.split
#   left << split[0].to_i
#   right << split[1].to_i
# end

# left = left.sort
# right = right.sort

# distance = 0

# left.length.times do |t|
#   distance += (right[t] - left[t]).abs
# end

# puts distance

##########
# PART TWO
##########
r_appearances = Hash.new(0)

input.each do |line|
  split = line.split
  left << split[0].to_i
  r_appearances[split[1].to_i] += 1
end

similarity_score = 0

left.each do |n|
  similarity_score += n * r_appearances[n]
end

puts similarity_score