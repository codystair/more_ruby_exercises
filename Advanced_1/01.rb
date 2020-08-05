factorials = Enumerator.new do |yielder|
  total = 1
  num = 0

  loop do
    total = num.zero? ? 1 : total * num
    yielder << total
    num += 1
  end
end

7.times { puts factorials.next }

factorials.rewind

factorials.each_with_index do |cur, i|
  puts cur
  break if i == 6
end
