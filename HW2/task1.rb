# frozen_string_literal: true

arr = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
p(arr.size,
  arr.reverse,
  arr.max,
  arr.min,
  arr.sort,
  arr.sort.reverse,
  arr.reject(&:odd?),
  arr.select { |e| (e % 3).zero? },
  arr.uniq,
  arr.map { |e| e.to_f / 10 },
  arr.select { |e| (65..90).include?(e) || (97..122).include?(e) }.map(&:chr),
  arr.map { |e| arr.minmax.include?(e) ? arr.minmax - [e] : e }.flatten,
  arr[0..arr.index(arr.min)],
  arr.min(3))
