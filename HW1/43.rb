# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, расположенных после первого максимального.'
arr = []
rand(5..15).times { arr << rand(98..100) }
p "#{arr}.size - arr.index(arr.max) - 1"
p arr.size - arr.index(arr.max) - 1
