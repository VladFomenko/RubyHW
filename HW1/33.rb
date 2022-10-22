p 'Дан целочисленный массив. Найти минимальный четный элемент.'
arr = []
rand(5..15).times { arr << rand(4..10) }
p "#{arr}.sort { |a,b| a <=> b }.uniq.each { |e| break e if e.even? }"
p arr.sort { |a,b| a <=> b }.uniq.each { |e| break e if e.even? }
