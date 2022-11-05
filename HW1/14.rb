# frozen_string_literal: true

p 'Дан целочисленный массив. Заменить все положительные элементы на значение минимального.'
arr = []
rand(5..15).times { arr << rand(-100..100) }
p "#{arr}.map { |e| e.positive? ? arr.min : e }"
p(arr.map { |e| e.positive? ? arr.min : e })
