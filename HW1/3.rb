p 'Дан целочисленный массив и число К. Если все элементы массива больше К, то вывести true; в противном случае вывести false.'
p "#{arr = [49, 79, 90, 70, 50, 60, 55, 72, 78, 82]}.map { |e| false if #{k = rand(1..99)} > e }.include?(false)"
p !arr.map { |e| false if k > e }.include?(false)
