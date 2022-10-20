p 'Дан целочисленный массив. Вывести индексы элементов, которые больше своего правого соседа, и количество таких чисел.'
p "#{arr = [43, 3, 72, 82, 9, 51, 23, 98, 60, 2]}.map!.with_index { |e, i| i if arr[i + 1].nil? ? false : e > arr[i + 1] }.compact!, arr.size)"
p(arr.map!.with_index { |e, i| i if arr[i + 1].nil? ? false : e > arr[i + 1] }.compact!, arr.size)
