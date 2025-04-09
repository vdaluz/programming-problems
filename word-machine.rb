def word_machine(str)
  puts str
  ops = str.split(' ')
  stack = []

  ops.each do |op|
    case op
    when 'POP'
      return '-1' if stack.empty?

      stack.pop
    when 'DUP'
      return '-1' if stack.empty?

      stack.push(stack.last)
    when '+'
      return '-1' if stack.length < 2

      x = stack.pop
      y = stack.pop
      res = x + y
      return '-1' unless number_valid?(res)

      stack.push(res)
    when '-'
      return '-1' if stack.length < 2

      x = stack.pop
      y = stack.pop
      res = x - y
      return '-1' unless number_valid?(res)

      stack.push(res)
    else
      res = op.to_i
      return '-1' unless number_valid?(res)

      stack.push(res)
    end
  end
  stack.empty? ? '-1' : stack.last.to_s
end

def number_valid?(number)
  number >= 0 && number <= (2**20) - 1
end
