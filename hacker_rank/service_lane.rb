# challenge url: https://www.hackerrank.com/challenges/service-lane

def largest_vehicle (enter, exit, width)
  # vehicle lengths
  bike = 1
  car = 2
  truck = 3

  service_section = width[enter..exit].map { |w| w.to_i } # section where vehicle is in service lane (integer array)

  # return vehicle based on widths
  return bike if service_section.include?(1)
  return truck unless service_section.include?(2)
  return car
end

freeway_length, num_test_cases = ARGF.readline.split(' ') # read first line and assign designated variables

width = ARGF.readline.split(' ') # second line is width array

# iterate through each test case
(0...num_test_cases.to_i).each do
  enter, exit = ARGF.readline.split(' ')
  enter = enter.to_i
  exit = exit.to_i
  puts largest_vehicle(enter, exit, width)
end