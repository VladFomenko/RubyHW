p 'Дан целочисленный массив. Найти индекс последнего минимального элемента.'
arr = []
rand(5..15).times { arr << rand(8..10) }
p "#{arr}.map.with_index { |e, i| e = [e, i] }.min { |a, b| [a[0], b[1]] <=> [b[0], a[1]] }[1]"
p arr.map.with_index { |e, i| e = [e, i] }.min { |a, b| [a[0], b[1]] <=> [b[0], a[1]] }[1]
