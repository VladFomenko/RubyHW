# frozen_string_literal: true

p 'Дан целочисленный массив. Найти два наибольших элемента.'
arr = []
rand(5..15).times { arr << rand(-50..50) }
p "(#{arr}.delete(arr.max), arr.max)"
p(arr.delete(arr.max), arr.max)
