p 'Дан целочисленный массив. Найти индекс минимального элемента.'
arr = []
rand(5..15).times { arr << rand(-10..10) }
p "#{arr}.find_index(arr.min)"
p arr.find_index(arr.min)
