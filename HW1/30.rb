# frozen_string_literal: true

p 'Дан целочисленный массив. Найти индекс последнего максимального элемента.'
arr = []
rand(5..15).times { arr << rand(8..10) }
p "#{arr}.arr.rindex(arr.max)"
p arr.rindex(arr.max)
