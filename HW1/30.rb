p 'Дан целочисленный массив. Найти индекс последнего максимального элемента.'
arr = []
rand(5..15).times { arr << rand(8..10) }
p "#{arr}.map.with_index { |e, i| e = [e, i] }.min { |a, b| [b[0], b[1]] <=> [a[0], a[1]] }[1]"
p arr.map.with_index { |e, i| e = [e, i] }.min { |a, b| [b[0], b[1]] <=> [a[0], a[1]] }[1]

