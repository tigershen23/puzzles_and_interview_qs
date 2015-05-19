#!/usr/bin/env ruby

# Given a string of letters separated by spaces,
# e.g. "b a c e f d i h g j": print them out
# in columns of three, alphabetically, e.g.
# a e h
# b f i
# c g j
# d

input = "b a c e f d i g h j k l m"
sorted_chars = input.split.sort

ROW_SIZE = 3

padding_needed = 3 - (sorted_chars.size % 3)
padding_needed.times do
  sorted_chars << ''
end

array_in_three_parts = sorted_chars.each_slice(3).to_a

# got to even out the columns (each_slice won't)
# this took me a looong time to figure out
col1, col2, col3 = array_in_three_parts.transpose

# the first array will have the largest size no matter
# what, so it dictates the number of rows to print
num_rows = col1.size / 3

puts "#{col1[0]}"

num_rows.times do |i|
  puts "#{col1[i]} #{col1[i+1]} #{col1[i+2]}"
end
