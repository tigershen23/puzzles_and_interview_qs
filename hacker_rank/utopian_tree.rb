# challenge url: https://www.hackerrank.com/challenges/utopian-tree

def height_change (cycles)
  height = 1
  if cycles == 0
    return height
  end
  (1..cycles).each do |c|
    if c % 2 != 0
      height *= 2
    else
      height +=1
    end
  end
  return height
end

num_test_cases = STDIN.gets.to_i

(0...num_test_cases).each do
  cycles = STDIN.gets.to_i
  puts height_change(cycles)
end

