====== How to run the program =====

The program is written in `ruby 2.0.0p247` on OS X, So it requires Ruby MRI installed on machine for running the program. After it go to the Root directory of the repository and run following command on terminal

  $ bundle install

This will install all dependent gems which are used for testing purpose.

Now you can run the application using following command

  $ bundle exec rake run

By default the program uses the `data/default_input.txt` as it's default input. but if you want to supply another file use following command

  $ ruby main.rb -f absolute_file_path


====== How to run test cases ======

Go to the root directory of the repository and make sure all gems are installed by typing following command
  $ bundle install
after that you can run test cases using following command
  $ bundle exec rake


====== Assumptions ======
1. I have assumed that each command is terminated by newline character.

2. Roman numbers are specified in capitals.

3. Resource name and Unit name are case sensitive

4. Assigning the Alien unit is seperated by space with 'is' inbetween the galactic unit and the assigned roman values.
eg: glob is I

5. Assigning the Alien resource with Credit is seperated by space with 'is' inbetween the Alien resource-name and the credit integer. Also the name of the resource starts with capital character, and it must come after
eg: glob glob Silver is 34 Credits

6. The command to query the value of unit must end with '?' and units are specified after keyword 'is'
eg: how much is pish tegj glob glob ?

7. The command to query the credit of resource must end with '?'. units are specified after keyword 'is' followed by Resource name.
eg: how many Credits is glob prok Silver ?

8. When the input is invalid instead of stopping the program execution I am printing appropriate error message. (This behaviour can easily changed by changing a single line in /lib/command_handler.rb line:11)

====== Code Design / Explanation ======

The start point of the program is 'merchants_guide.rb'. This file reads the input text file one line at a time. The input string of single line is then passed to respected command handler by matching with regular expression. I have created a seprate class for each type of known command, so when we want to introduce new command in to application we just need to introduce a new class with similar behavior. All the command handlers are inside '/lib/command_handlers/' directory.

I have used two singleton classes GalaxyUnitsManager and GalaxyResourcesManager for keeping track of Alien units (e.g. 'glob', 'prok' etc.) and Alien resources prices (e.g. 'Silver', 'Gold' etc.). This classes supports registration of new unit/resource and getting the value of existing resource/unit.

The Alien Unit is mapped with RomanNumbers. RomanNumbers class exposes 'to_i' method, which converts the roman number to human readable integer. Custom exception classes are defined inside the 'lib/guide_exceptions/'. They all inherits from 'GuideException' class which inherits from 'StandardError' class of Ruby.

Output is printed using 'OutputHandler.print' method throughout the application so if we want to change out put medium from console to other mean(e.g. file) we just need to change in one place.

  
