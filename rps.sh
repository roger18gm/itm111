#!/bin/bash

choice=0
computer_choice() {

	computer=$(( ( RANDOM % 3 ) + 1 ))
	if (( "$computer" == 1 ))
	then
		echo "Computer chose 1. Rock"
	elif (( "$computer" == 2 ))
	then
		echo "Computer chose 2. Paper"
	elif (( "$computer" == 3 ))
	then
		echo "Computer chose 3. Scissors"
	fi
}

get_winner() {

	if (( choice == computer )); 
	then
		echo "You tied. Try again."
	elif (( choice == 1 && computer == 3 )) || (( choice == 2 && computer == 1 )) || (( choice = 3 && computer == 2 ));
	then
		echo "You win."
	else
		echo "You lost."
	fi
}
while [choice !=4];
	echo ""
	echo "1. Rock"
	echo "2. Paper"
	echo "3. Scissors"
	echo "4. Done"

	read -p "Your choice [1-4]? " choice

	if [choice == 1];
	then
		echo "You chose 1. Rock"
		echo "$computer_choice()"
		echo "$get_winner()"
	elif [choice == 2];
	then
		echo "You chose 2. Paper"
		echo "$computer_choice()"
		echo "$get_winner()"
	elif [choice == 3];
	then
		echo "You chose 2. Paper"
		echo "$computer_choice()"
		echo "$get_winner()"
	elif [choice == 4];
		echo ""
		echo "Bye."
		exit	
	fi
done
