# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, расположенных перед последним максимальным.'
arr = []
rand(5..15).times { arr << rand(-100..100) }
p "#{arr}.arr.find_index(arr.reverse!.max)"
p arr.size - arr.find_index(arr.reverse!.max) - 1
