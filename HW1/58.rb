# frozen_string_literal: true

p 'Дан целочисленный массив. Вывести вначале все его нечетные элементы, а затем - четные.'
arr = []
rand(5..15).times { arr << rand(14..15) }
p "(#{arr}.select(&:odd?) + arr.select(&:even?)"
p(arr.select(&:odd?) + arr.select(&:even?))
