# frozen_string_literal: true

p 'Дан целочисленный массив. Проверить, чередуются ли в нем положительные и отрицательные числа.'
arr = []
3.times { arr << rand(-5..5) }
p "(#{arr}[0...arr.size - 1].select.with_index
   { |e, i| !(e.positive? && arr[i + 1].negative? or arr[i + 1].positive? && e.negative?) }.empty?"
p arr[0...arr.size - 1].select
                       .with_index { |e, i| e.positive? && arr[i + 1].positive? or arr[i + 1].negative? && e.negative? }
                       .empty?
