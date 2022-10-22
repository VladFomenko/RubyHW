p 'Дан целочисленный массив. Найти количество элементов, расположенных после последнего максимального.'
arr = []
rand(5..15).times { arr << rand(7..10) }
p "#{arr}.arr.find_index(arr.reverse!.max)"
p arr.find_index(arr.reverse!.max)
