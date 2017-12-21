require 'byebug'

class Array
  def my_each
    i = 0
    while i < self.length
      yield (self[i])
      i+= 1
    end
    self
  end

  def my_select
    arr = []
    self.my_each{|el| arr.push(el) if yield el}
    arr
  end

  def my_reject
    arr = []
    self.my_each { |el| arr.push(el) unless yield el}
    arr
  end

  def my_any
    self.my_each {|el| return true if yield el}
    return false
  end

  def my_flatten
    arr = []
    self.my_each do |el|
      if (el.is_a?(Array))
        arr.concat(el.my_flatten)
      else
        arr.concat([el])
      end
    end
    arr
  end

  def my_zip(*args)
    ans = []
    i = 0;
    self.my_each do |el|
      subset = [el]
      args.my_each do |array|
        subset.push(array[i])
      end
      ans.push(subset)
      i += 1
    end
    return ans
  end

  def my_rotate(a=1)
    self.drop(a % self.length).concat(self.take(a % self.length))
  end
end



array = [1, 2, 3]
a = [4, 5, 6]
b = [7]


if __FILE__ == $0
  # p array.my_each{ |el|  p (el* 5) }
  # p array.my_select { |num| num > 1 } # => [2, 3]
  # p array.my_reject { |num| num > 1 } # => [1]
  # p array.my_any { |num| num > 1 } # => true
  # p array.my_any { |num| num == 4 } # => false
  # p array.my_zip(a, b)
  p array.my_rotate(1)
  p array.my_rotate(4)
  p array.my_rotate(-1)
  p array.my_rotate(-4)
  # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

end
