# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, расположенных перед первым минимальным.'
arr = []
rand(5..15).times { arr << rand(-100..100) }
p "#{arr}.index(arr.min)"
p arr.index(arr.min)
