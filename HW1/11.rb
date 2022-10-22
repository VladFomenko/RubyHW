p 'Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.'
arr = []
rand(5..15).times {arr << rand(10..100) }
p "#{arr}.select(&:even?), #{arr}.select(&:odd?))"
p(arr.select(&:even?), arr.select(&:odd?))
