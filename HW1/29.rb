# frozen_string_literal: true

p 'Дан целочисленный массив. Найти индекс последнего минимального элемента.'
arr = []
rand(5..15).times { arr << rand(8..10) }
p "#{arr}.rindex(arr.min)"
p arr.rindex(arr.min)
