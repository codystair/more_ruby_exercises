items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *items, last|
  puts items.join(', ')
  puts last
end

gather(items) do | item1, *items, item4|
  puts item1
  puts items.join(', ')
  puts item4
end

gather(items) do | item1, *items|
  puts item1
  puts items.join(', ')
end

gather(items) do | item1, item2, item3, item4|
  puts items.join(', ')
end