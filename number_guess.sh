#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Function to get user details or add a new user
get_user() {
  echo "Enter your username:"
  read USERNAME
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  if [[ -z $USER_ID ]]; then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    $($PSQL "INSERT INTO users(username) VALUES('$USERNAME');" > /dev/null 2>&1)
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  else
    USER_DETAILS=$($PSQL "SELECT username, games_played, best_game FROM users WHERE user_id=$USER_ID;")
    echo "$USER_DETAILS" | while IFS=\| read USERNAME GAMES_PLAYED BEST_GAME; do
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
}

# Function to play the game
play_game() {
  SECRET_NUMBER=$((RANDOM % 1000 + 1))
  echo "Guess the secret number between 1 and 1000:"
  NUMBER_OF_GUESSES=0
  while true; do
    read GUESS
    if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
    else
      ((NUMBER_OF_GUESSES++))
      if [[ $GUESS -lt $SECRET_NUMBER ]]; then
        echo "It's higher than that, guess again:"
      elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
        echo "It's lower than that, guess again:"
      else
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        $($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);" > /dev/null 2>&1)
        GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
        BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")
        $($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE user_id=$USER_ID;" > /dev/null 2>&1)
        break
      fi
    fi
  done
}

# Execute functions
get_user
play_game

