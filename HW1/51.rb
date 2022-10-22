p 'Дан целочисленный массив. Найти количество элементов, между первым и последним минимальным.'
arr = []
rand(5..15).times { arr << rand(9..10) }
p "#{arr}.size - arr.find_index(arr.reverse!.min) - arr.find_index(arr.reverse!.min) - 2"
p arr.size - arr.find_index(arr.reverse!.min) - arr.find_index(arr.reverse!.min) - 2
