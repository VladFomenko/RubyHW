p 'Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют убывающую последовательность.'
arr = []
rand(5..15).times { arr << rand(-10..10) }
p "#{arr}.uniq.map.with_index { |e, i| e = { i => e } }.sort { |a, b| b.values <=> a.values }.map{ |e| e = e.keys }.flatten"
p arr.uniq.map.with_index { |e, i| e = { i => e } }.sort { |a, b| b.values <=> a.values }.map { |e| e = e.keys }.flatten
