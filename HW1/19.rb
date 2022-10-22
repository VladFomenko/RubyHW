p 'Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наиболее близок к данному числу'
arr = []
p "N = #{number = rand(1..100)}"
rand(5..15).times { arr << rand(10..100) }
p "#{arr}.min_by { |e| (number - e).abs }"
p arr.min_by { |e| (number - e).abs }
