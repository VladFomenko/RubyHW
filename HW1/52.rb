# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, между первым и последним максимальным.'
arr = []
rand(5..15).times { arr << rand(9..10) }
p "#{arr}.size - arr.find_index(arr.reverse!.max) - arr.find_index(arr.reverse!.max) - 2"
p arr.size - arr.find_index(arr.reverse!.max) - arr.find_index(arr.reverse!.max) - 2
