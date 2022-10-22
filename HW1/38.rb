p 'Дан целочисленный массив. Найти максимальный отрицательный элемент.'
arr = []
rand(5..15).times { arr << rand(-10..10) }
p "#{arr}.sort { |a,b| a <=> b }.uniq.each { |e| break e if e.negative? }"
p arr.sort { |a,b| a <=> b }.uniq.each { |e| break e if e.negative? }
