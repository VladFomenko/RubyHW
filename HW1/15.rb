p 'Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию.'
arr = []
rand(5..15).times { arr << rand(10..100) }
p "(#{arr}.rotate(-1)"
p arr.rotate(-1)


