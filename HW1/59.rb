# frozen_string_literal: true

p 'Дан целочисленный массив. Проверить, чередуются ли в нем четные и нечетные числа.'
arr = []
4.times { arr << rand(14..15) }
p "(#{arr}[0...arr.size - 1].select.with_index { |e, i| !(e.even? && arr[i + 1].odd? or arr[i + 1].even? && e.odd?) }.empty?"
p arr[0...arr.size - 1].select.with_index { |e, i| !(e.even? && arr[i + 1].odd? or arr[i + 1].even? && e.odd?) }.empty?
