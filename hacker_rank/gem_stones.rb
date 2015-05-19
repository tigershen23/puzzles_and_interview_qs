# challenge url: https://www.hackerrank.com/challenges/gem-stones

num_rocks = ARGF.readline.to_i

gem_elements = []

first_rock = ARGF.readline.strip.split("") # delete trailing newline character with Array#split

first_rock.uniq.each { |stone| gem_elements << stone } # no duplicates

(0...num_rocks - 1).each do
    rock = ARGF.readline.split("")
    gem_elements.delete_if { |gem| !rock.include?(gem) } # if anything in gem_elements isn't present, it can't be part of the solution
end

print gem_elements.size
