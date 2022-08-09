#--------------------------------------------------------------------------
# 
# Script Name: TypingChallenge.rb
# Version:     1.0
# Author:      Jerry Lee Ford, Jr.
# Date:        March 2010
# 
# Description: This Ruby script demonstrates how to apply conditional logic 
#              in order to analyze user input and control script execution 
#              through the development of a computer typing test that
#              evaluates the player's typing skills.
#
# Modified by: Andres Cardenas
# Date:        09/08/2022
#--------------------------------------------------------------------------


# Define custom classes ---------------------------------------------------

#Define a class representing the console window
class Screen

  def cls  #Define a method that clears the display area
    puts ("\n" * 20)  #Scroll the screen 25 times
    puts "\a"  #Make a little noise to get the player's attention
  end
  
  def pause    #Define a method that pauses the display area
    STDIN.gets  #Execute the STDIN class's gets method to pause script
                #execution until the player presses the Enter key
  end
  
end

#Define a class representing the typing test
class Test
 
  #This method displays the 8-ball greeting message
  def display_greeting
  
    Console_Screen.cls  #Clear the display area
  
    #Display a welcome screen
    print "\t\t  Welcome to the Ruby Typing Challenge game!" +
    "\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
               "continue. \n\n: "
  
  Console_Screen.pause       #Pause the game

  end
 
  #Define a method to be used to present test instructions
  def display_instructions
    
    Console_Screen.cls       #Clear the display area
    puts "\t\t\tInstructions:\n\n"  #Display a heading

    #Display the game's instructions
    # CHANGED TO 10 SENTENCES INSTEAD OF 5
    # Added grading scale
    puts %Q{    This test consists of a series of 10 typing challenges.
    The challenge sentences are presented one at a time. To respond 
    correctly, you must retype each sentence exactly as shown and press 
    the Enter key. Your grade will be displayed at the end of the test.
    \n\n
    The grading system is the following:
    A if you get 9 or 10 sentences correctly.
    B if you get 8 sentences correctly.
    C if you get 7 sentences correctly.
    D if you get 6 sentences correctly.
    F if you get 5 or less sentences correctly.
    \n\n
    Press Enter to continue.\n\n}

    Console_Screen.pause       #Pause the game
    
  end
 
  #Define a method to be used to present typing challenges
  def present_test(challenge)
    result = ""   #initialize result variable to be used un the until loop
    until result != "" do   #repeat the loop until result is not empty
      Console_Screen.cls       #Clear the display area
      print challenge + "\n\n: "  #Display the challenge sentence
      result = STDIN.gets  #Collect the player's input
      result.chop!         #Remove the end of line marker
      #Analyze the player input and see if it is empty
      if result == "" then
        Console_Screen.cls       #Clear the display area
        print "Empty answer!\n\nPress Enter to try again."
        Console_Screen.pause       #Pause the game
      elsif challenge == result then
        #Keep track of the number of correctly retyped challenge sentences
        $noRight += 1
        Console_Screen.cls       #Clear the display area
        #Keep the player informed
        print "Correct!\n\nPress Enter to continue."
        Console_Screen.pause       #Pause the game
      else
        Console_Screen.cls       #Clear the display area
        #Keep the player informed
        print "Incorrect!\n"
        #Display players wrong answer and then the correct sentence
        puts "Your answer was: "+result
        puts "The correct sentence is: "+challenge
        print "Press Enter to continue."
        Console_Screen.pause       #Clear the game
      end
    end
  end

  #Define a method to be used to display test results
  def determine_grade
  
    Console_Screen.cls       #Clear the display area  

    #Grade base solution using letters A, B, C, D, F with a case block
    case
    when ($noRight.between?(0,5))
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      puts "Your grade is F.\n\nPress Enter to continue."
    when ($noRight.equal?(6))
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      puts "Your grade is D.\n\nPress Enter to continue."
    when ($noRight.equal?(7))
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      puts "Your grade is C.\n\nPress Enter to continue."
    when ($noRight.equal?(8))
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      puts "Your grade is B.\n\nPress Enter to continue."
    when ($noRight.between?(9,10))
      print "You retyped " + $noRight.to_s + " sentence(s) correctly. "
      puts "Your grade is A.\n\nPress Enter to continue."
    else
      puts"Invalid Result!"

    end

    #To pass the test the player must correctly retype 6 sentence


  end

end


# Main Script Logic -------------------------------------------------------

#Initialize global variable that will be used to keep track of the number
#of correctly retyped sentences
$noRight = 0

Console_Screen = Screen.new  #Instantiate a new Screen object
Typing_Test = Test.new        #Instantiate a new Test object

#Execute the Test object's display_greeting method
Typing_Test.display_greeting

#Execute the Screen object's cls method in order to clear the screen
Console_Screen.cls

#Prompt the player for permission to begin the test
print "Would you like to test your typing skills? (y/n)\n\n: "

answer = STDIN.gets  #Collect the player's response
answer.chop!  #Remove any extra characters appended to the string
  
#Loop until the player enters y or n and do not accept any other input.
until answer == "y" || answer == "n"

  Console_Screen.cls  #Clear the display area

  #Prompt the player for permission to begin the test
  print "Would you like to test your typing skills? (y/n)\n\n: "

  answer = STDIN.gets  #Collect the player's response
  answer.chop!  #Remove any extra characters appended to the string

end 

#Analyze the player's response
if answer == "n"  #See if the player elected not to play

  Console_Screen.cls  #Clear the display area

  #Invite the player to return and play again
  puts "Okay, perhaps another time.\n\n"

else  #The player wants to take the test

  #Execute the Test object's display_instructions method
  Typing_Test.display_instructions
  
  #Display typing challenges and grade each answer by calling on the
  #Test object's present_test method
  Typing_Test.present_test "In the end there can be only one."
  Typing_Test.present_test "Once a great plague swept across the land."
  Typing_Test.present_test "Welcome to Ruby Principles of Ruby Programming"
  Typing_Test.present_test "There are very few problems in the world that enough M&Ms cannot fix."
  Typing_Test.present_test "Perhaps today is a good day to die. Fight beside me and let us die together."

  #Adding 5 extra sentences
  Typing_Test.present_test "How many times do i have to tell you?"
  Typing_Test.present_test "For each letter you must present your results."
  Typing_Test.present_test "I don't want to die tomorrow knowing i could've have a piece of cake tonight."
  Typing_Test.present_test "When you think about it, is not as bad as it sounds."
  Typing_Test.present_test "I agree to the terms and conditions."

  #Notify the player of the results by executing the Test object's 
  #display_instructions method
  Typing_Test.determine_grade

  Console_Screen.pause       #Pause the game
  
  Console_Screen.cls  #Clear the display area
  #Thank the player for taking the typing test
  puts "Thank you for taking the Ruby Typing Challenge.\n\n"

end


