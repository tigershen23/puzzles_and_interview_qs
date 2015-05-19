# challenge url: https://www.hackerrank.com/challenges/halloween-party

num_tests = ARGF.readline.to_i

# alternate between horizontal/vertical cuts

def make_cuts (num_times)
	# even number of cuts produces a square with side length of (num_times / 2)
	# odd number produces the same as the previous even number + one extra row/col of length (num_times / 2)
	num_times % 2 == 0 ? (num_times / 2) ** 2 : (num_times / 2) ** 2 + (num_times / 2)
end

num_tests.times { puts make_cuts(ARGF.readline.to_i) } # run make cuts on each line of input