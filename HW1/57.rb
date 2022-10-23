# frozen_string_literal: true

p 'Дан целочисленный массив. Вывести вначале все его четные элементы, а затем - нечетные.'
arr = []
rand(5..15).times { arr << rand(14..15) }
p "(#{arr}.select(&:even?) + arr.select(&:odd?)"
p(arr.select(&:even?) + arr.select(&:odd?))
