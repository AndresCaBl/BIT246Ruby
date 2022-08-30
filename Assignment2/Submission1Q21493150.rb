#--------------------------------------------------------------------------
#
# Script Name: Submission 1 Q2
# Version: 1.0
# Author: Andres Cardenas - s1493150
# Date: 27th August, 2022
#
# Description: This program will look for a folder given by an user in a directory given by an user
#              The user will be required to enter first the path and second the folder name to look for
#              If found, user will be shown folder contents
#              If not found, error message displayed
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
    greeting = "In this program you will be required to enter a path directory and then a folder name. The program will then search if that folder exist in the path\n\nPress ENTER to start\n"
    print greeting
  end

  def say_goodbye
    goodbye = "\n\nThank you for using this folder finder by Andres Cardenas. \nHave a nice day :)\n"
    print goodbye
  end
end

#-------Folder Handling--------#

##
#This class represents a file

class Folder_Handling

  # Check if folder exists in path
  #
  # @param [String, #read] file path

  def folder_check (dir)
    print "Searching...\n\n"
    if File.exist?(dir) then   #uses the .exist? to check if folder exist in path
      puts ("The folder exist in the directory!")
      puts ("Press ENTER to see its contents")
      STDIN.gets  #Execute the STDIN class's gets method to pause script
      display_folder_content(dir)
      else
        print ("Error: The folder or path was not found!\nError ID: s1496150AndresC") #if folder not found, print error message
      end
  end

  # Prints folder content
  #
  # @param [String, #read] file path

  def display_folder_content(dir)

    Dir.foreach(dir) do |entry|
        puts entry
      end
  end

end




#-------Main Logic--------#

Console_s = Screen.new #creates a new console
Folder_new = Folder_Handling.new #creates a new file object which will be used to handle the file

Console_s.cls  #clear the console
Console_s.say_greeting  #print program instructions
Console_s.pause

print "Enter the path to search\n"
f_path = STDIN.gets  #Collect users input for path
f_path.chop!  #Remove any extra characters appended to the string

print "Enter the folder name to search\n"
f_name = STDIN.gets  #Collect users input for folder name
f_name.chop!  #Remove any extra characters appended to the string

f_search = f_path+"/"+f_name  #concatenate both inputs into one string to search for

Folder_new.folder_check(f_search)   #uses method folder_check to look for folder. Passes on strong from user

Console_s.say_goodbye #prints las message

