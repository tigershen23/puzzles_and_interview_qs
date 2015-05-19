# challenge url: https://www.hackerrank.com/challenges/chocolate-feast

num_test_cases = ARGF.readline.to_i

def chocolates_eaten(money, choc_price, wrappers_free_choc)
  chocolates_eaten = money / choc_price
  wrappers = chocolates_eaten # each chocolate gives one wrapper

  until wrappers < wrappers_free_choc
    extra_chocolates = wrappers / wrappers_free_choc
    chocolates_eaten += extra_chocolates
    wrappers -= extra_chocolates * wrappers_free_choc # subtract number of wrappers traded in
    wrappers += extra_chocolates # extra chocolates also give wrappers
  end

  chocolates_eaten
end

num_test_cases.times do
  # more efficient way to do this?
  args = ARGF.readline.split(" ").map { |arg| arg.to_i }
  # test cases are written: N C M (money, chocolate price, wrappers for a free chocolate)
  puts chocolates_eaten(args[0], args[1], args[2])
end