p 'Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].'
arr = []
rand(5..15).times {arr << rand(10..100) }
p "(#{arr}.select { |e| break true if arr[0] < e and e < arr[-1] }"
p arr.select { |e| break true if arr[0] < e and e < arr[-1] }
