#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


HANDLE_INPUT(){
  if [[ ! $VALUE =~ ^[0-9]+$ ]]
  then
  ASK_INPUT "That is not an integer, guess again:"
  else
  if [[ $VALUE < $SECRET ]]
  then
  ASK_INPUT "It's higher than that, guess again:"
  elif [[ $VALUE > $SECRET ]]
  then
  ASK_INPUT "It's lower than that, guess again:"
  else

  echo -e "You guessed it in $(echo $TIMES | sed -E 's/^ *| *%//') tries. The secret number was $(echo $SECRET | sed -E 's/^ *| *%//'). Nice job!"


  BEST_SCORE=$($PSQL "select least_tries from users where name = '$NAME'")
  NEW_SCORE=$(( BEST_SCORE > TIMES ? TIMES : BEST_SCORE))
  GAME_PLAYED=$($PSQL "select games_played from users where name = '$NAME'")
  NEW_GAMES=$(( GAME_PLAYED + 1 ))
  STATUS=$($PSQL "update users set games_played = $NEW_GAMES, least_tries = $NEW_SCORE where name='$NAME'")
  fi
  fi
}

ASK_INPUT(){
  echo "$1";
  read VALUE
  TIMES=$(( TIMES + 1))
  HANDLE_INPUT
}


echo "Enter your username:"
read NAME

echo "$($PSQL "select * from users where name = '$NAME'")" | while IFS="|" read USER_ID _NAME GAMES TRIES
do
if [[ -z $_NAME ]]
then
echo Welcome, $(echo $NAME | sed -E 's/^ *| *%//')! It looks like this is your first time here.
STAUS=$($PSQL "insert into users(name, games_played, least_tries) values('$NAME', 0, 999)")
else
echo Welcome back, $(echo $_NAME | sed -E 's/^ *| *%//')! You have played $(echo $GAMES | sed -E 's/^ *| *%//') games, and your best game took $(echo $TRIES | sed -E 's/^ *| *%//') guesses.
fi
done


SECRET=$(( RANDOM % 1000 ))
TIMES=0
ASK_INPUT "Guess the secret number between 1 and 1000:"
