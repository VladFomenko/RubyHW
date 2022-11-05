# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество его локальных максимумов.	'
arr = []
rand(5..15).times { arr << rand(10..100) }
p "#{arr}.each.with_index.reduce(0) { |acc, (e, i)|
    i != 0 && i != arr.size - 1 && e > arr[i + 1] && e > arr[i - 1] ? acc + 1 : acc }"
p arr.each.with_index
     .reduce(0) { |acc, (e, i)| i != 0 && i != arr.size - 1 && e > arr[i + 1] && e > arr[i - 1] ? acc + 1 : acc }
