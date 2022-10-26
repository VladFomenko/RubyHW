# frozen_string_literal: true

p 'Дан целочисленный массив и число К. Если существует элемент, меньший К, то вывести true;
    в противном случае вывести false.'
p "array = #{arr = [49, 79, 90, 70, 50, 60, 55, 72, 78, 82]}.arr.map { |e| e < #{k = rand(1..99)} }.include?(true)"
p arr.map { |e| e < k }.include?(true)
