#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
if [[ $YEAR != year ]]
then

# find team id
W_ID=$($PSQL "select team_id from teams where name='$WINNER'")
# if not found
if [[ -z $W_ID ]]
then
# insert into teams
ADD_T=$($PSQL "insert into teams(name) values('$WINNER')")
# find new team id
W_ID=$($PSQL "select team_id from teams where name='$WINNER'")
fi 
# find o team id
O_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
# if not found
if [[ -z $O_ID ]]
then
# insert into teams
ADD_T=$($PSQL "insert into teams(name) values('$OPPONENT')")
# find new o team id
O_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
fi 

# insert into games
ADD_T=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $W_ID, $O_ID, $W_GOALS, $O_GOALS)")
if [[ $ADD_T == "INSERT 0 1" ]]
then
echo inserted $YEAR $ROUND
fi
fi
done
