p 'Дан целочисленный массив. Найти количество элементов, расположенных после первого минимального'
arr = []
rand(5..15).times { arr << rand(-100..100) }
p "#{arr}.size - arr.find_index(arr.min) - 1"
p arr.size - arr.find_index(arr.min) - 1
