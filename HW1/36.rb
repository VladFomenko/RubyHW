p 'Дан целочисленный массив. Найти максимальный нечетный элемент.'
arr = []
rand(5..15).times { arr << rand(1..100) }
p "#{arr}.sort { |a,b| b <=> a }.uniq.each { |e| break e if e.odd? }"
p arr.sort { |a,b| b <=> a }.uniq.each { |e| break e if e.odd? }