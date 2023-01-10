#! /usr/bin/bash
DELAY=1 # Number of seconds to display results
while true; do

    echo "*****************************************************************************************"
    echo "Please choose from the following options; type the option number and hit the <Enter> key."
    echo -e "\n"
    echo "a) Display the present working directory"
    echo "b) List names of files in a given directory"
    echo "c) Display today's date and time"
    echo "d) Display whether a file is a ordinary file or a directory"
    echo "e) Execute a command line"
    echo "q) Exit the program"
    echo "******************************************************************************************"
    read -p "Enter your choice and hit <Enter>: " choice

    case $choice in
        a) 
            pwd 
            ;;
        b)
            read -p "Please enter the directory path :" dir
	    if [ -d "$dir" ] ; then 
		    ls -l  "$dir"
	    else
		   echo "$dir is not a directory"
	    fi 	 			     
            ;;
        c)
           date
	   ;;
	d) 
            read -p "Please enter file name : " file
            if [ -d "$file" ]; then
                echo "$file is a directory"
            elif [ -f "$file" ]; then
                echo "$file is a ordinary  file"
            else
                echo "$file does not exist, or it is neither an ordinary file not a directory  "
            fi
            ;;
        e)
            read -p "Please enter a command to be executed: " command
            eval $command	
	   ;;
	q)
		echo "Bye now"
		exit 0 
		;;
  	*) 
      	   echo "Invalid choice "		
		;;
    esac
    sleep "$DELAY"
 
done