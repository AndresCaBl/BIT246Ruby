#--------------------------------------------------------------------------
#
# Script Name: Submission 1 Q1
# Version: 1.0
# Author: Andres Cardenas - s1493150
# Date: 23rd August, 2022
#
# Description: This is the logic for Assignment 2. This program will:
#              Verify the file exist
#              Read the file and check if it contains the phrase "Ruby on Rails"
#              If exist, file contents will be printed to screen
#              If it doesnt, it will print an error message
#
# Requirements: .txt file must be in same directory
#
# Last Update: 27/08/2022
#
#--------------------------------------------------------------------------
#

class Screen

  def cls  #Define a method that clears the display area
    puts ("\n" * 20)  #Scroll the screen 20 times
  end
  def pause  #Define a method that pauses the display area
    STDIN.gets  #Execute the STDIN class's gets method to pause script
  end
  def say_greeting
    greeting = "Please note that the .txt file and this script must be in the same directory for the program to work.\n\nPress ENTER to continue\n"
    print greeting
  end

  def say_goodbye
    goodbye = "\n\nThank you for using this phrase finder by Andres Cardenas. \nHave a nice day :)\n"
    print goodbye
  end
end

#-------File Handling--------#

##
#This class represents a file

class File_Handling

  # Get the file full directory
  #
  # @return [String] Full path including file

  def  file_dir
    dirname = File.expand_path(File.dirname(__FILE__))   #Obtain the path in which the file and script are located
    dir =dirname+"/Story1493150.txt"  #concatenate the file path to the file name
    return dir #return file path
  end




  # Check if file exists in path
  #
  # @param [String, #read] file path

  def file_check (dir)
    if File.exist?(dir) then   #uses the .exist? to check if file exist in directory
      puts "\nThe File Exist\nSearching for the Phrase 'Ruby In Rails'..."
      if read_lines(dir) == true then   #if exist, calls method to check if phrase is in file
        print "\nPhrase found!\n"
        print_lines(dir)  #if found, call method to print file content
      else
        print ("Phrase not found, Sorry :(") #if phrase not found, print error message
      end
    else
      puts "The file doesn't exist, Sorry :(" #if file not found, print error message
    end
  end

  # check if phrase is in file
  #
  # @param [String, #read] file path
  # @return [Boolean] False if not in file, true if phrase is found

  def read_lines(dir)
    found = false   #set found value to false
    File.open(dir) do |input_file| #opens the file from the directory given as argument
      input_file.each do |line| # read each line
        if line =~ /Ruby on Rails/ then #checks for the phrase "Ruby on Rails"
          found = true  # if found, changes the value of foud to true
        end
      end
    end
    return found  #returns found value
  end

  # print file contents
  #
  # @param [String, #read] file path

  def print_lines(dir)
    File.open(dir) do |input_file| #opens the file from the directory given as argument
      input_file.each do |line| # read each line
        print line # prints each line
      end
    end
  end
end

#-------Main Logic--------#

Console_s = Screen.new #creates a new console

File_new = File_Handling.new #creates a new file object which will be used to handle the file
file_dir = File_new.file_dir #saves the file path in a variable

Console_s.cls  #clear the console
Console_s.say_greeting  #print program instructions
Console_s.pause #waits for user to press enter
File_new.file_check(file_dir) #calls file method
Console_s.say_goodbye #prints las message


