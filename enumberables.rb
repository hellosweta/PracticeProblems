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

  def my_rotate

  end
end
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])  == [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)
c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)
