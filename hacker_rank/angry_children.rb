# challenge url: https://www.hackerrank.com/challenges/angry-children

# Code required to read in the values of k,n and candies.
n = gets.to_i
k = gets.to_i
candy = Array.new(n)
for i in 0..n-1
      candy[i] = gets.to_i
end

unfairness = 10**9
subs = candy.combination(k).to_a.flat_map
print subs
# subsets.each do |ary|
#   temp_unfairness = ary.max - ary.min
#   unfairness = temp_unfairness if temp_unfairness < unfairness
# end
# unfairness


# ans = ### Compute answer from k, n, candies
# puts ans

# def calculate_unfairness(num_packets, num_children, packets_array)
#   unfairness = 10**9
#   subsets = packets_array.combination(num_children).to_a
#   print subsets
#   subsets.each do |ary|
#     temp_unfairness = ary.max - ary.min
#     unfairness = temp_unfairness if temp_unfairness < unfairness
#   end
#   unfairness
# end

# calculate_unfairness(n, k, candy)
