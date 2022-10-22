p 'Дан целочисленный массив. Найти максимальный из его локальных максимумов.'
arr = []
rand(5..15).times { arr << rand(10..100) }
p "#{arr}[1...arr.size - 1].each_with_index.reduce([]) { |acc, (e, i)| e > arr[i + 2] && e > arr[i] ? acc << e : acc }.max"
p arr[1...arr.size - 1].each_with_index.reduce([]) { |acc, (e, i)| e > arr[i + 2] && e > arr[i] ? acc << e : acc }.max

