p 'Дан целочисленный массив и число К. Вывести индекс последнего элемента, меньшего К.'
p "array = #{arr = [49, 79, 90, 70, 10, 60, 28, 72, 78, 82]}, K = #{k = rand(1..100)}"
p 'arr.reverse.each.with_index { |e, i| break (arr.size - 1 - i) if e < k }'
p arr.reverse.each.with_index { |e, i| break (arr.size - 1 - i)  if e < k }
