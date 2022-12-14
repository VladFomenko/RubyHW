# frozen_string_literal: true

p 'Дан целочисленный массив. Вывести индексы массива в том порядке,
   в котором соответствующие им элементы образуют возрастающую последовательность'
arr = []
rand(5..15).times { arr << rand(-10..10) }
p "#{arr}.uniq.map.with_index { |e, i| { i => e } }
     .sort { |a, b| a.values <=> b.values }.map(&:keys).flatten"
p arr.uniq.map.with_index { |e, i| { i => e } }
     .sort { |a, b| a.values <=> b.values }.map(&:keys).flatten
