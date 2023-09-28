#!/bin/bash


function charCheck (){
	local input=$1
	local type=$2

	if [ "$type" == "letter" ] && [[ ! "$input" =~ ^[a-zA-Z]+$ ]]; then
		echo " Only letters are allowed."
		return 1
	elif [ "$type" == "number" ] && [[ ! "$input" =~ ^[0-9]+$ ]]; then
		echo " Only numbers are allowed."
		return 1
	elif [ "$type" == "email" ] && [[ ! "$input" =~ ^[a-zA-Z.@0-9]+$ ]]; then
		echo " Only letters and @ . are allowed"
		return 1
	fi

	return 0;
}

function createContact (){


	printf "\n"
	read -r -p " Insert a name: " name
	while ! charCheck "$name" "letter"; do
		read -r -p " Insert a valid name: " name
	done

	read -r -p " Insert a last name: " lastName
	while ! charCheck "$lastName" "letter"; do
		read -r -p " Insert a valid last name: " lastName
	done

	if ! charCheck "$lastName" "letter" ; then exit; fi

	read -r -p " Insert email: " email
	while ! charCheck "$email" "email"; do
		read -r -p " Insert a valid email: " email
	done

	read -r -p " Insert phone: " phone
	while ! charCheck "$phone" "phone"; do
		read -r -p " Insert a valid phone number: " phone
	done


	local contactInfo="$name $lastName $email $phone"
	if echo "$contactInfo" >> contacts.txt; then
		printf "\n Contact added!\n"
		return 0
	else
		printf " Failed to add the contact\n"
		return 1
	fi
}

function searchContact (){
	printf "\n"
	read -r -p " Search for contacts with a word: " searchWord
	printf "\n"
	grep "$searchWord" contacts.txt 
}

function help (){
	printf "\nHelp Menu

	Menu Navigation:
	Enter the number option followed by an enter, to select any option

	Creating a new contact:
	To create a new contact, select the first option of the menu with the number 1
	Now, type the data required in order: name, last name, email and phone numb

	Search for a contact:
	The user can search any previous contact saved, by entering the second option of the menu with the number 2
	Once inside the second option, just type the word/number you want to search followed by an enter
	"
}

function mainMenu (){
	local menu

	while [ "$menu" != 'ex' ]; do
		printf "\n"
		echo "1 - Create a new contact"
		echo "2 - Search"
		echo "3 - Help"
		echo "4 - Exit program"

		read -r -p "Select any option: " menu

		case "$menu" in
			1) createContact;;
			2) searchContact;;
			3) help;;
			4) printf "Bye!\n"
				menu="ex";;
			*) printf "\n Not a valid option \n"
		esac
	done
}

mainMenu




