# frozen_string_literal: true

p 'Дан целочисленный массив. Найти количество нечетных элементов.'
p "array = #{arr = [49, 79, 90, 70, 50, 60, 55, 72, 78, 82]}.select(&:odd?).size"
p arr.select(&:odd?).size
