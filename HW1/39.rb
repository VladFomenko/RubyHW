p 'Дан целочисленный массив и интервал a..b. Найти минимальный из элементов в этом интервале.'
arr = []
arr_second = (rand(-50..-30)..rand(30..50))
rand(5..15).times { arr << rand(-100..100) }
p "#{arr}.select! { |e| #{arr_second}.include?(e) }.min"
p arr.select! { |e| arr_second.include?(e) }.min
