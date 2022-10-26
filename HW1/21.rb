# frozen_string_literal: true

p 'Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент.'
arr = []
rand(5..15).times { arr << rand(-10..10) }
p "#{arr}.each_with_index { |e, i| arr[i] = [e, 0] if e.negative? }.flatten"
p arr.each_with_index { |e, i| arr[i] = [e, 0] if e.negative? }.flatten
