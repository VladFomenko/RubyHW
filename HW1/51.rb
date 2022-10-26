# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, между первым и последним минимальным.'
arr = []
rand(5..15).times { arr << rand(9..10) }
p "#{arr}.rindex(arr.min) - arr.index(arr.min) - 1"
p arr.rindex(arr.min) - arr.index(arr.min) - 1
