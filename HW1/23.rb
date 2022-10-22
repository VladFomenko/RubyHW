p 'Дан целочисленный массив. Упорядочить его по убыванию.'
arr = []
rand(5..15).times { arr << rand(-10..10) }
p "#{arr}.sort { |a, b| a <=> b }"
p arr.sort { |a, b| b <=> a }

