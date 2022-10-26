# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество элементов, расположенных после последнего минимального .'
arr = []
rand(5..15).times { arr << rand(7..10) }
p "#{arr}.arr.find_index(arr.reverse!.min)"
p arr.find_index(arr.reverse!.min)
