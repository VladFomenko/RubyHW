# frozen_string_literal: true

p 'Дан целочисленный массив и число К. Вывести индекс последнего элемента, меньшего К.'
arr = []
rand(5..15).times { arr << rand(1..100) }
p "array = #{arr}, K = #{k = rand(1..100)}"
p "arr.rindex { |e| e < k }.nil? ? 'Not element < K' : arr.rindex { |e| e < k }"
p arr.rindex { |e| e < k }.nil? ? 'No element < K' : arr.rindex { |e| e < k }
