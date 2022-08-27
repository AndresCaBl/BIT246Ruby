puts "abcd #{5*3} efg"
puts "abcd \n efg"
puts 'abcd #{5*3} efg'

puts "Enter value to convert"
cel = STDIN.gets
cel.chop!
far = ((cel.to_f * 1.8) + 32)
puts "#{cel} celsius are #{far}"