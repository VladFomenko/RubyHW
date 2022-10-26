# frozen_string_literal: true

p 'Дано натуральное число N. Если N - нечетное, то найти произведение 1*3*…*N;
    если N - четное, то найти произведение 2*4*…*N.'
p "#{n = rand(1..10)}.odd? ? (1..n).select(&:odd?).reduce(:*) : (1..n).select(&:even?).reduce(:*)"
p n.odd? ? (1..n).select(&:odd?).reduce(:*) : (1..n).select(&:even?).reduce(:*)
