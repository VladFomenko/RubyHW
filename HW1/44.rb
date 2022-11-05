# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, расположенных после первого минимального'
arr = []
rand(5..15).times { arr << rand(-10..-8) }
p "#{arr}.size - arr.index(arr.min) - 1"
p arr.size - arr.index(arr.min) - 1
