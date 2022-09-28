#!/bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~\n"

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "Welcome to my salon, how can I help you?\n"


MAIN_MENU(){
SERVICES=$($PSQL "select service_id, name from services order by service_id")
echo "$SERVICES" | while read SERVICE_ID BAR NAME
do
echo "$SERVICE_ID) $NAME"
done
read SERVICE_ID_SELECTED
HANDLE_SERVICE
}

HANDLE_SERVICE(){
if [[ ! $SERVICE_ID_SELECTED =~ [1-3] ]]
then
echo -e "\nEnter a valid option!!!!\n"
MAIN_MENU
else
echo -e "\nEnter your Phone Number:"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
echo -e "\nEnter your name:\n"
read CUSTOMER_NAME
ADD_USER_STATUS=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
fi
echo -e "\nEnter time for appointment:"
read SERVICE_TIME
CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
ADD_APPOINTMENT=$($PSQL "insert into appointments(time, customer_id, service_id) values('$SERVICE_TIME',$CUSTOMER_ID, $SERVICE_ID_SELECTED)")
SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *%//') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *%//')."
fi
}

MAIN_MENU
