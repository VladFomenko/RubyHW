# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, расположенных перед последним минимальным.'
arr = []
rand(5..15).times { arr << rand(-100..100) }
p "#{arr}.rindex(arr.min)"
p arr.rindex(arr.min)
