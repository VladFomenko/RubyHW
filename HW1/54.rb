# frozen_string_literal: true

p 'Дан целочисленный массив. Найти два наименьших элемента.'
arr = []
rand(5..15).times { arr << rand(-40..50) }
p "(#{arr}.delete(arr.min), arr.min)"
p(arr.delete(arr.min), arr.min)
