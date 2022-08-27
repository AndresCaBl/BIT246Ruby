def  category(age)
  case
  when (age.between?(0,2))
    puts "baby"
  when(age.between?(3,6))
    puts "little child"
  when  (age.between?(7,12))
    puts"child"
  when (age.between?(13,18))
    puts"youth"
  else
    puts "adult"
  end
end

#single line

=begin
This is a comment line
it explains that the next line of code displays
a welcome message
=end