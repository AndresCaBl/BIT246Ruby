# This is almost the same. This time, however, we're going to split the string
# on white space (spaces, new lines, tabs) and print each word individually.


INPUT = "/Users/andrescardenas/Documents/GitHub/BIT246Ruby/week5/Week 5 - File Handling Tutorial Workshop 1/example1.txt"

input_file = File.open(INPUT) #do |input_file|
      #####{{{1.Other way of declaring input _file is File.open(INPUT) do |input_file| and you use "end" at the end. look at the commented "end" at the EoF.

  input_file.each do |line|

    #{{{ 2. Split the file into words and print each on its own line.
    # Last time, we printed everything. This time, we'll split each line on
    # spaces and print out the words, one on each line.
    
	line.split.each do |word|
       	   puts  word #line 
    	end
    #}}}

  end
      ######end}}}.
