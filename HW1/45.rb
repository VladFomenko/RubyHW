# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, расположенных перед последним максимальным.'
arr = []
rand(5..15).times { arr << rand(8..10) }
p "#{arr}.rindex(arr.max)"
p arr.rindex(arr.max)
