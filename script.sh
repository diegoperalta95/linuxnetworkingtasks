#!/bin/bash
menu=""

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
            read -r -p " Insert a last name: " lastName
            read -r -p " Insert email: " email
            read -r -p " Insert phone: " phone
            contactInfo="$name $lastName $email $phone"
            if echo "$contactInfo" >> contacts.txt; then
                printf "\n Contact added!\n"
            else
                printf " Failed to add the contact\n"
            fi
            ;;
        2) printf "Search";;
        3) printf "Help";;
        4) 
            printf "Bye!\n"
            menu="ex";;
        *) printf "\n Not a valid option \n"
    esac
done

