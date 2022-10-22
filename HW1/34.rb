p 'Дан целочисленный массив. Найти минимальный нечетный элемент.'
arr = []
rand(5..15).times { arr << rand(1..100) }
p "#{arr}.sort { |a,b| a <=> b }.uniq.each { |e| break e if e.odd? }"
p arr.sort { |a,b| a <=> b }.uniq.each { |e| break e if e.odd? }
