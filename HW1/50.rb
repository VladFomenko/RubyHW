p 'Дан целочисленный массив. Найти индекс последнего экстремального (то есть минимального или максимального) элемента.'
arr = []
rand(5..15).times { arr << rand(-100..100) }
p "#{arr}"
p '[arr.find_index(arr.min), arr.find_index(arr.max)].max'
p [arr.find_index(arr.min), arr.find_index(arr.max)].max
