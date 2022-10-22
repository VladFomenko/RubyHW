p 'Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять.'
arr = []
rand(5..15).times { arr << rand(10..100) }
p "#{arr}.map.with_index { |e, i| (i != 0 and i != arr.size - 1 and e.even?) ? e + arr.first : e }"
p arr.map.with_index { |e, i| (i != 0 and i != arr.size - 1 and e.even?) ? e + arr.first : e }
