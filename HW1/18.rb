p 'Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают.'
arr = []
rand(5..15).times { arr << rand(10..100) }
p "#{arr}[1...arr.size - 1].each.with_index.reduce(0) { |acc, (e, i)| e < arr[i] && e < arr[i + 2] ? acc + 1 : acc }"
p arr[1...arr.size - 1].each.with_index.reduce(0) { |acc, (e, i)| e < arr[i] && e < arr[i + 2] ? acc + 1 : acc }
