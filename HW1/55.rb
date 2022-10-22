p 'Дан целочисленный массив. Найти максимальное количество подряд идущих минимальных элементов.'
arr = []
rand(5..15).times { arr << rand(14..15) }
p "(#{arr}.delete(arr.min), arr.min)"
p arr.map { |e| e == arr.min }.uniq(false)
