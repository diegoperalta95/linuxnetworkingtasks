#!/bin/bash
menu=""

function charCheck (){
    if [ "$2" == "letter" ]; then
        if [[ ! "$1" =~ ^[a-zA-Z]+$ ]]; then
            echo "Only letters are allowed."
            return 1
        fi
    elif [ "$2" == "number" ]; then
        if [[ ! "$1" =~ ^[0-9]+$ ]]; then
            echo "Only numbers are allowed."
            return 1
        fi
    else
        if [[ ! "$1" =~ ^[a-zA-Z.@0-9]+$ ]]; then
            echo "Only letters and @ . are allowed"
            return 1
        fi
    fi
    return 0;
}

while [ "$menu" != 'ex' ]
do
    printf "\n"
    echo "1 - Create a new contact"
    echo "2 - Search"
    echo "3 - Help"
    echo "4 - Exit program"
    
    read -r -p "Select any option: " menu
    
    case "$menu" in
        1) 
            printf "\n"
            read -r -p " Insert a name: " name
            if ! charCheck "$name" "letter" ; then exit; fi
            read -r -p " Insert a last name: " lastName
            if ! charCheck "$lastName" "letter" ; then exit; fi
            read -r -p " Insert email: " email
            if ! charCheck "$email" "email" ; then exit; fi
            read -r -p " Insert phone: " phone
            if ! charCheck "$phone" "number" ; then exit; fi
            contactInfo="$name $lastName $email $phone"
            if echo "$contactInfo" >> contacts.txt; then
                printf "\n Contact added!\n"
            else
                printf " Failed to add the contact\n"
            fi
            ;;
        2) 
            printf "\n"
            read -r -p " Search for contacts with a word: " searchWord
            printf "\n"
            grep "$searchWord" contacts.txt 
            ;;
        3) 
            printf "\nHelp Menu

 Menu Navigation:
  Enter the number option followed by an enter, to select any option
                 
 Creating a new contact:
  To create a new contact, select the first option of the menu with the number 1
  Now, type the data required in order: name, last name, email and phone number

 Search for a contact:
  The user can search any previous contact saved, by entering the second option of the menu with the number 2
  Once inside the second option, just type the word/number you want to search followed by an enter
"
            ;;
        4) 
            printf "Bye!\n"
            menu="ex";;
        *) printf "\n Not a valid option \n"
    esac
done



