#--------------------------------------------------------------------------
#
# Script Name: Submission 1
# Version: 1.0
# Author: Andres Cardenas
# Date: 23rd August, 2022
#
# Description: This is the logic for Assignment 2. This program will:
#   Verify the file exist
#   Read the file and check if it contains the phrase "Ruby on Rails"
#
# Requirements: .txt file must be in same directory
#
#--------------------------------------------------------------------------
#



dirname = File.expand_path(File.dirname(__FILE__)) #We obtain the path in which the file and script are located
INPUT =dirname+"/Story1493150.txt"
if File.exist?(INPUT) then
  found = false
  File.open(INPUT) do |input_file|
    input_file.each do |line|
      if line =~ /Ruby on Rails/ then
        File.open(INPUT).each do |line|;
        puts line
        end
      else
        puts "Phrase Not Found!"
      end

    end
  end
else
  puts "The file does not exist in this directory, please create it!"
end













# if File.exist?(INPUTDIR)  then
  #
  #Dir.entries returns an array with all the entries within the specified directory. Dir.foreach provides the same feature
  #
  # Dir.foreach(INPUTDIR) do |entry|

    ## if the file is a text file - String ends with '.txt'
    # if entry =~ /\.txt$/  then
    #   puts entry
    # end


  # end
# end
#
#
# INPUT = "/Users/andrescardenas/Documents/GitHub/BIT246Ruby/week5/Week 5 - File Handling Tutorial Workshop 1/example1.txt"
# #}}}
#
# #{{{ 2. Open the file and pass the file object to a block.
# # Now, open the file. This executes the block (do |input_file| ... end), with
# # 'input_file' assigned to the File object. When the block is done, the file is
# # automatically closed.
# File.open(INPUT) do |input_file|
#   #}}}
#
#   #{{{ 3. Read each line from the file and print it to the screen.
#   # This executes the block (do |line| ... end) for every line in the file.
#   x=1
#   input_file.each do |line|
#     puts x.to_s+"."+line
#     x+=1
#   end
#   #}}}
#
  #{{{ 4. Close the block from #2.
# end
# #}}}