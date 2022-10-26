# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, расположенных после последнего минимального .'
arr = []
rand(5..15).times { arr << rand(7..10) }
p "#{arr}.size - arr.rindex(arr.min) - 1"
p arr.size - arr.rindex(arr.min) - 1
