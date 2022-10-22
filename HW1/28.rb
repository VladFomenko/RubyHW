p 'Дан целочисленный массив. Найти индекс первого максимального элемента.'
arr = []
rand(5..15).times { arr << rand(8..10) }
p "#{arr}.find_index(arr.max)"
p arr.find_index(arr.max)

