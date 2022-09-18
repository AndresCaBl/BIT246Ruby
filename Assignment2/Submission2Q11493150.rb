#--------------------------------------------------------------------------
#
# Script Name: Submission 2 Q1
# Version: 1.0
# Author: Andres Cardenas - s1493150
# Date: 17th September, 2022
#
# Description: This program will require the user to enter a path and a term to search in all .docx documents in the path
#              Output a list of names of documents containing the term
#              Output total number of .docx documents containing term
#              Output number of times the term is in each document
#              SEARCH IS NOT CASE SENSITIVE
#
# Last Update: 18/09/2022
#
#--------------------------------------------------------------------------
#
require 'search_in_file'  #Gem required to search in .docx files
require 'htmltoword'  #Gem required to create a new word document

class Screen

  def cls  #Define a method that clears the display area
    puts ("\n" * 20)  #Scroll the screen 20 times
  end
  def pause  #Define a method that pauses the display area
    STDIN.gets  #Execute the STDIN class's gets method to pause script
  end
  def say_greeting
    greeting = "In this program you will be required to enter a path directory and then phrase, word or term to look for. The program will then search if that folder exist in the path.\nIf it exists, it will search for the term in all .docx documents.\nIf the the program doesn't find any matches, it will create a new .docx document with the term inside.\nThe program is not case sensitive\n\nPress ENTER to start\n"
    print greeting
  end

  def say_goodbye
    goodbye = "\n\nThank you for using this .docx term finder by Andres Cardenas. \nHave a nice day :)\n"
    print goodbye
  end
end

#-------Folder Handling--------#

##
#This class represents a path

class Folder_Handling

  # Check if folder exists in path
  #
  # @param [String, #read] file path

  def folder_check (dir, terms)
    Console_s.cls # clears screen
    print "Searching...\n\n"
    if Dir.exist?(dir) then   #uses .exist? to check if folder exist in path
      puts ("The folder exist in the directory!\n")
      Search_new.find_term(dir, terms) #calls in  the find term class passing the path and ter to look for
    else
      print ("Error: The folder or path was not found!\nError ID: FNF-s1496150AndresC") #if folder not found, print error message
    end
  end

end

#-------File Handling--------#

#this class will handle all related searches in the file
class Search_file

  # creates a new hash with the files paths and paragraphs
  #
  # @param [String, #read] file path
  # @param [String, #read] term to search for

  def find_term (dir, terms)
    #
    rel_hash = SearchInFile.search(dir,terms) #Creates a new hash using the the SearchInFile class from the gem search_in_file

    #this  code will check if the hash is empty, meaning the term was not found in any file
    if rel_hash.size == 0 then
      print "\nThe term '#{terms}' was not found.\nCreating new file...\n"
      Search_new.create_file(dir,terms) #calls methid to create a new word file

      #this codes check only the word documents in the path
    elsif check_word_files(rel_hash)== 0 then
      print "\nThe term '#{terms}' was not found in any .docx file.\nCreating new file...\n"
      Search_new.create_file(dir,terms) #if the term was not found in any of the word files, it will create a new file

      #this code will execute the handling to get the names and number of times the term is in each file
    else
      files_names(rel_hash, terms)
    end
  end


  # Count the number of .docx files in the hash
  #
  # @param [Hash, #read] hash created by search_in_file
  # @return [Integer, #read] Number of .docx files in the hash

  def check_word_files(rel_hash)
    file_count=0  #set initial vaue to 0
    for a in 0..(rel_hash.size - 1) do #loop to iterate through the whole hash
      if File.extname(rel_hash[a][:file]) == ".docx" then #check the file extension by using .extname
        file_count +=1  #if condition met, count adds 1
      end
    end
    return file_count #returns final value
  end


  # prints the file names
  #
  # @param [Hash, #read] hash created by search_in_file
  # @param [String, #read] term to search for

  def files_names (rel_hash, terms)
    file_count=0  # used to count the total amount of files containing the term
    print "\n\nDOCUMENT NAMES\n"
    for a in 0..(rel_hash.size - 1) do #loop to iterate through the whole hash
      if File.extname(rel_hash[a][:file]) == ".docx" then #check the file extension by using .extname
        file_count +=1 #if condition met, adds to count
        print "\nName: "+File.basename(rel_hash[a][:file])  #uses .basename to print file name
        print "\nNumber or times in file: #{number_repeat(rel_hash,a)}" #prints number of times term is in file by calling the method number_repeat
        print "\n"
      end
    end
    print "\n\nDOCUMENT COUNT\n"
    print "the term '#{terms}', is in #{file_count} .docx document/s"
  end


  # Method to count the number of times the term in is the file
  #
  # @param [Hash, #read] hash created by search_in_file containing array of paragraphs
  # @param [int, #read] index of item to search number of terms in
  # @return [Integer, #read] Number of times term is in the file

  def number_repeat (rel_hash, ind_hash)
    count_word = 0 #count set to 0 at the start of each method call
    hash_to_string = rel_hash[ind_hash][:paragraphs].to_s #convert the paragraph in the selected index into a string.
    string_split_to_array = hash_to_string.split #creates a new array with each word as an element. used default delimitation " "
    string_split_to_array.each { |each_word| #iterates though each item of the array
      if each_word =~ /ruby/i then #chech if the item is equals to ruby. not case sensitive.
        count_word +=1 #incoreases the count by one if condition is met.
      end
    }
    return count_word

  end


  # Creates a new .docx file with the assigned string
  #
  # @param [String, #read] file path
  # @param [String, #read] term to write

  def create_file (dir,term)

    current_time = Time.now.to_i #gets current time to generate unique timestamp when creating the file
    doc_name= dir+"/TermNotFoundS1493150_#{current_time}.docx" #creates a new path and file name
    Htmltoword::Document.create_and_save(term, doc_name) #uses the htmltoword gem document object and .create_and_save method to create a name using the path, file name and term as input
    puts "\nFile '#{File.basename(doc_name)}' was created successfully at '#{dir}'"
  end

end

#-------Main Logic--------#

Console_s = Screen.new #creates a new console
Folder_new = Folder_Handling.new #creates a new file object which will be used to handle the file
Search_new = Search_file.new

Console_s.cls  #clear the console
Console_s.say_greeting  #print program instructions
Console_s.pause



print "Enter the path to search\n"
f_path = STDIN.gets  #Collect users input for path
f_path.chop!  #Remove any extra characters appended to the string



print "Enter the phrase, word or term you'd like to search\n"
search_terms = STDIN.gets  #Collect users input for folder name
search_terms.chop!  #Remove any extra characters appended to the string



# check if folder exist
Folder_new.folder_check(f_path, search_terms)   #uses method folder_check to look for folder. Passes on string from user

Console_s.say_goodbye #prints last message

