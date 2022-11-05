# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, между первым и последним максимальным.'
arr = []
rand(5..15).times { arr << rand(9..10) }
p "#{arr}.rindex(arr.max) - arr.index(arr.max) - 1"
p arr.rindex(arr.max) - arr.index(arr.max) - 1
