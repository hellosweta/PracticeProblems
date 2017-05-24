def my_flatten(array)

  flattened_array = []

  array.each do |el|
    if  el.is_a?(Array)
      flattened_array.concat(my_flatten(el))
    else
      flattened_array << el
    end
  end

  flattened_array
end

puts my_flatten([[1,2,[3]],4]) == [1,2,3,4]
puts my_flatten([[1,2,[3]],[4]]) == [1,2,3,4]
puts my_flatten([1,2,3,4]) == [1,2,3,4]
puts my_flatten([1, 2, 3, [4, [5, 6]], [[[7]], 8]]) == [1,2,3,4,5,6,7,8]
