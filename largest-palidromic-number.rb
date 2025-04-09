def largest_palindromic(num)
  return num if num.length == 1

  frequency = Array.new(10, 0)

  left = []
  middle = ''

  num.each_char do |digit|
    frequency[digit.to_i] += 1
  end

  9.downto(0) do |digit|
    middle = digit.to_s if middle.empty? && frequency[digit] % 2 == 1
    next if frequency[digit] < 2
    next if digit.zero? && left.empty?

    num_pairs = frequency[digit] / 2
    left << digit.to_s * num_pairs
    # frequency[digit] -= num_pairs * 2
  end

  return '0' if left.empty? && middle.empty?

  left.join + middle + left.reverse.join
end