p 'Дан целочисленный массив. Найти максимальный четный элемент.'
arr = []
rand(5..15).times { arr << rand(1..100) }
p "#{arr}.sort { |a,b| b <=> a }.uniq.each { |e| break e if e.even? }"
p arr.sort { |a,b| b <=> a }.uniq.each { |e| break e if e.even? }
