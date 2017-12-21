require 'byebug'
primes = []
num = 2
p __FILE__
p $0
while primes.count < 100
  is_prime = true
  (2...num).each do |idx|
    if num % idx == 0
      is_prime = false
      debugger
      break
    end
  end

  if is_prime
    primes << num
  end
  num += 1
end
# p primes

def is_prime?(num)
  return false if num < 2
  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  return true
end

def primes(num_primes)
  primes = []
  testnum = 1
  while primes.count < num_primes
    if is_prime?(testnum)
      primes << testnum
    end
    testnum += 1
  end
   primes
end

if __FILE__ == $PROGRAM_NAME
  p primes(12)
end
