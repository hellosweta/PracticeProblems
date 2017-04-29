class Array
  def my_zip(*args)
    result = Array.new(self.length) { Array.new }
    result.each_with_index do |array, idx|
      array << self[idx]
      args.each do |input|
        array << input[idx]
      end
    end
    result
  end

  def my_rotate(shift = 1)
    rotated = self.dup
    shift = shift % rotated.length
    shift.times do
      rotated.push(rotated.shift)
    end
    rotated
  end

  def my_join(delineator = "")
    joined = ""
    self.each_with_index do |el, idx|
      joined << el
      joined << delineator unless idx == self.length - 1
    end
    joined
  end

  def my_flatten
    results = []
    self.each do |el|
      if el.is_a?(Integer)
        results << el
      else
        results.concat(el.my_flatten)
      end
    end
    results
  end

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    results = []
    self.my_each { |x| results << x if prc.call(x) }
    results
  end

  def my_inject(accumulator = nil, &prc)
    if accumulator.nil?
      accumulator = self[0]
      partial = self.dup[1..-1]
    else
      partial = self.dup
    end

    partial.each do |el|
      accumulator = prc.call(accumulator, el)
    end

    accumulator

  end
end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])  == [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate       == ["b", "c", "d", "a"]
# p a.my_rotate(2)      == ["c", "d", "a", "b"]
# p a.my_rotate(-3)     == ["b", "c", "d", "a"]
# p a.my_rotate(15)     == ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         == "abcd"
# p a.my_join("$")    == "a$b$c$d"
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
#
#
# p return_value  # => [1, 2, 3]
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []
p [1,2,3,4,5,6].my_inject { | sum, x | sum += x  }
