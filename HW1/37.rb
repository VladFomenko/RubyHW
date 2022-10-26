# frozen_string_literal: true

p 'Дан целочисленный массив. Найти минимальный положительный элемент.'
arr = []
rand(5..15).times { arr << rand(-10..10) }
p "#{arr}.sort { |a,b| a <=> b }.uniq.each { |e| break e if e.positive? }"
p(arr.sort { |a, b| a <=> b }.uniq.each { |e| break e if e.positive? })
