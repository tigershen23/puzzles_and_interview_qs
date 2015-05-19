# challenge url: https://www.hackerrank.com/challenges/filling-jars

first_line = ARGF.readline.split.map { |a| a.to_i }

num_jars = first_line[0]
num_test_cases = first_line[1]
$jars = Array.new(num_jars, 0) # intialize $jars to an array of size num_jars with each element 0

def add_candy (start_jar, end_jar, amount)
  # add amount to each element of the section of $jars, stick it back into $jars
  $jars[(start_jar - 1)..(end_jar - 1)] = new_ary = $jars[(start_jar - 1)..(end_jar - 1)].map { |val| val + amount }
end

num_test_cases.times do
  next_line = ARGF.readline.split.map { |a| a.to_i }
  add_candy(next_line[0], next_line[1], next_line[2])   # line is formatted: start, end, amount
end

average_candy = $jars.inject(:+) / num_jars
puts average_candy