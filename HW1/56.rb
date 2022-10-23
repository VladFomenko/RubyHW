# frozen_string_literal: true

p 'Дан целочисленный массив. Найти максимальное количество подряд идущих максимальных элементов.'
arr = []
rand(5..15).times { arr << rand(14..15) }
p "(#{arr}.map { |e| e == arr.max ? e : ' ' }.join.squeeze.strip.split.map { |e| e.length / arr.min.to_s.length }.max"
p arr.map { |e| e == arr.max ? e : ' ' }
     .join
     .squeeze
     .strip
     .split
     .map { |e| e.length / arr.min.to_s.length }.max
