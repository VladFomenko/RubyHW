# frozen_string_literal: true

p 'Дан целочисленный массив. Найти все четные элементы.'
p "array = #{arr = [43, 3, 72, 82, 9, 51, 23, 98, 60, 2]}.select(&:even?)"
p arr.select(&:even?)
