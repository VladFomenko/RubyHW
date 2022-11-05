# frozen_string_literal: true

p 'Дан целочисленный массив. Найти индекс максимального элемента.'
arr = []
rand(5..15).times { arr << rand(-10..10) }
p "#{arr}.find_index(arr.max)"
p arr.find_index(arr.max)
