# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, расположенных перед последним минимальным.'
arr = []
rand(5..15).times { arr << rand(-100..100) }
p "#{arr}.arr.find_index(arr.reverse!.min)"
p arr.size - arr.find_index(arr.reverse!.min) - 1
