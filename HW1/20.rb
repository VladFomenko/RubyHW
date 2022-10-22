p 'Дан целочисленный массив. Преобразовать его, вставив перед каждым положительным элементом нулевой элемент.'
arr = []
rand(5..15).times { arr << rand(-10..10) }
p "#{arr}.each_with_index { |e, i| arr[i] = [0, e] if e.positive? }.flatten"
p arr.each_with_index { |e, i| arr[i] = [0, e] if e.positive? }.flatten
