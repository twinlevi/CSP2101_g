#!/bin/bash
# Levi Lewis
# Student number - 10347422

# Alter min and max variables to change age / number ranges as desired.
min=20
max=70
RANGE=$(($max-$min+1)) # +1 is to account for the final number in the total count.

# Menu options 

menufunc() {
    clear
        echo "This is a guessing game, guess my age"
        echo "My age is between $min and $max"
}
menufunc
#  '$RANDOM'Generates a random number between 0 and 32767
# This function will be called again later to reassign a new number easily.
randomgen() {
    result=$RANDOM;
    # Controls what number we generate based on our min and max variables which is compounded in our RANGE variable.
    let "result %= $RANGE";
    # sets the lowest number generated as out $min variable instead of 0. The base number is 0 by default.
    result=$(($result+$min)); 
    return $result
}
randomgen

# guessing loop
while true
do
    echo "     Enter (q) to Quit"
    echo "" 
    echo -n "Enter your guess here: " 
    read GUESS

# Exit conditions if "q" entered.
    if [[ $GUESS = q ]]; then
        echo "Exiting now... Thanks for playing"
            sleep 3
            break

# If number is outside the range then show incorrect input
    elif (( $GUESS < $min )) || (( $GUESS > $max ));  then
        echo " Incorrect input - Enter a number between $min and $max"

# Show statement if guess to low   
    elif [[ $GUESS < $result ]]; then
        echo "Your guess was to low, please try again..."

# Show statement if guess to high          
    elif [[ $GUESS > $result ]]; then
        echo "Your guess was to high, please try again..."

# If the guess matches the generated number then..        
    elif (( $GUESS == $result )); then
        echo "Congratulations you guessed correctly!!"

# Loop after correct guess, to display a new menu asking the user if they want to play again.
        while true
        do
            echo "Do you wish to play again?"; 
            echo -n "Press (y) for YES or (q) to QUIT: " 
            read ANSWER

# exits the game from second menu. 
            if [[ $ANSWER = q ]]; then
                echo "Exiting now... Thanks for playing"
                sleep 3
                exit

# Restarts the guessing loop, and generates a new randomgen number.
            elif [[ $ANSWER = y ]]; then
                clear
                echo "  NEW ROUND HAS STARTED"
                echo "" 
                randomgen
                break
            fi
        done   
    fi
done