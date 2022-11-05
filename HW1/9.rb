# frozen_string_literal: true

p 'Дано число А и натуральное число N. Найти результат следующего выражения 1 + А + А*2 + А*3 + … + А*N.'
p "A = #{a = rand(1..10)}, B = #{b = rand(1..10)}.  (1..#{b}).reduce(1) { |acc, e| acc + a * e }"
p((1..b).reduce(1) { |acc, e| acc + a * e })
