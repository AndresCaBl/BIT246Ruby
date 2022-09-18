require 'search_in_file'
require 'htmltoword'
# if File.exist?("/Users/andrescardenas/Documents/GitHub/BIT246Ruby/Week7") then
#   p "exists"
# end


my_html = 'ruby'
document = Htmltoword::Document.create(my_html)
file = Htmltoword::Document.create_and_save(my_html, "/Users/andrescardenas/Documents/GitHub/BIT246Ruby/Week7/test.docx")
# File.open("/Users/andrescardenas/Documents/GitHub/BIT246Ruby/Week7/test.txt", "w")

rel_hash = SearchInFile.search("/Users/andrescardenas/Documents/GitHub/BIT246Ruby/Week7","ruby")

puts rel_hash.class
puts rel_hash[0].class
puts "============================="
puts rel_hash.size
puts rel_hash[0][:file]
puts rel_hash[0][:paragraphs]

puts "============================="
puts rel_hash
puts "============================="
#file nameRR
for a in 0..(rel_hash.size - 1) do
  puts rel_hash[a][:file]
  p File.basename(rel_hash[a][:file])
  p File.extname(rel_hash[a][:file])

  # my_string2 = rel_hash[a][:file]
  # my_array2 = my_string2.split("/")
  # puts my_array2[-1]
end
puts "============================="
#Number of times
count_word = 0
p "inicio: "+count_word.to_s
for a in 0..(rel_hash.size - 1) do
  print rel_hash[a][:paragraphs]
  my_arrayS = rel_hash[a][:paragraphs]
  my_arrayS.each { |i|
    arstring = i.to_s
    arrs = arstring.split
    arrs.each { |word|
      if word =~ /ruby/ then
        count_word +=1
      end
    }
  }
end
p "final: "+count_word.to_s
puts "============================="

#Number of times
count_word2 = 0
p "inicio2: "+count_word2.to_s
for a in 0..(rel_hash.size - 1) do
  print rel_hash[a][:paragraphs]
  rel_hash[a][:paragraphs].each { |i|
    arraty_to_string = i.to_s
    str_of_array = arraty_to_string.split
    str_of_array.each { |word|
      if word =~ /ruby/ then
        count_word2 +=1
      end
}
  }
end
p"/n"
p "final2: "+count_word2.to_s
