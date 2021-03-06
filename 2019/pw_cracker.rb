# Log log log
def log
  false
end

# Day 4.1
# Determine the password thingie
# However, they do remember a few key facts about the password:
#
# It is a six-digit number.
# The value is within the range given in your puzzle input.
# Two adjacent digits are the same (like 22 in 122345).
# Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
# Other than the range rule, the following are true:
#
# 111111 meets these criteria (double 11, never decreases).
# 223450 does not meet these criteria (decreasing pair of digits 50).
# 123789 does not meet these criteria (no double).
# How many different passwords within the range given in your puzzle input meet these criteria?
def pw_cracker(input)
  potentials = {}

  (low, high) = input.split(/-/).map(&:to_i)
  (low..high).each do |n|
    cd = check_digits(n, low, high)
    ca = check_adjacent_digits n
    ci = check_increasing_digits n

    if cd and ca and ci
      potentials[n] = 1
    end
  end

  potentials.keys.count
end

def pw_cracker_2(input)
  potentials = {}

  (low, high) = input.split(/-/).map(&:to_i)
  (low..high).each do |n|
    cd = check_digits(n, low, high)
    ca = check_adjacent_digits_2 n
    ci = check_increasing_digits n

    if cd and ca and ci
      potentials[n] = 1
    end
  end

  potentials.keys.count
end

# It is a six-digit number. (and between the range)
def check_digits(n, low, high)
  if n.to_s.length == 6 and n >= low and n <= high
    true
  else
    false
  end
end

# Two adjacent digits are the same (like 22 in 122345).
def check_adjacent_digits(n)
  n_array = n.to_s.split ''

  (1..n_array.length - 1).each do |i|
    if n_array[i] == n_array[i-1]
      return true
    end
  end

  false
end

# Two adjacent digits are the same (like 22 in 122345).
# the two adjacent matching digits are not part of a larger group of matching digits.
# If there is one set of doubles everything else is ok.
def check_adjacent_digits_2(n)
  double = false
  narr = n.to_s.split ''

  #(1..narr.length - 1).each do |i|
  #  if (narr[i] == narr[i-1] and narr[i] != narr[i+1]) and
  #      (narr[i] == narr[i-1] and narr[i] != narr[i-2])
  #    return true
  #  end
  #end

  (0..narr.length - 1).each do |i|
    case i
    when 0
      if narr[i] == narr[i+1] and narr[i+1] != narr[i+2]
        double = true
      end
    when 1..3
      if narr[i] == narr[i+1] and narr[i+1] != narr[i+2] and narr[i] != narr[i-1]
        double = true
      end
    when 4
      if narr[i] == narr[i+1] and narr[i] != narr[i-1]
        double = true
      end
    end
  end

  double
end

# Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
def check_increasing_digits(n)
  n_array = n.to_s.split ''

  (1..n_array.length - 1).each do |i|
    if n_array[i] < n_array[i-1]
      return false
    end
  end

  true
end
