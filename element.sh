#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ -z $1 ]]
then
echo Please provide an element as an argument.
else
if [[ ! $1 =~ ^[0-9]+$ ]]
then
NUMBER=$($PSQL "select atomic_number from elements where symbol = '$1' or name = '$1'")
else
NUMBER=$($PSQL "select atomic_number from elements where atomic_number = $1")
fi
if [[ -z $NUMBER ]]
then
echo I could not find that element in the database.
else
echo "$($PSQL "select atomic_number, symbol, name, boiling_point_celsius, melting_point_celsius, atomic_mass, type from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number = $NUMBER")" | while IFS="|" read NUMBER SYMBOL NAME BP MP MASS TYPE
do
echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."   
done

fi

fi
