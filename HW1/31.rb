# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество минимальных элементов.'
arr = []
rand(5..15).times { arr << rand(8..10) }
p "#{arr}.sort! { |a,b| a <=> b }.reduce(0) { |acc, e| arr[0] == e ? acc + 1 : acc }"
p arr.sort! { |a, b| a <=> b }.reduce(0) { |acc, e| arr[0] == e ? acc + 1 : acc }
