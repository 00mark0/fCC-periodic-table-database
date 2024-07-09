#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Connect to the database and fetch element details
ELEMENT_INFO=$(psql --username=freecodecamp --dbname=periodic_table -t --no-align -c "
  SELECT elements.atomic_number, elements.name, elements.symbol, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, types.type
  FROM elements
  JOIN properties ON elements.atomic_number = properties.atomic_number
  JOIN types ON properties.type_id = types.type_id
  WHERE elements.atomic_number::text = '$1' OR elements.symbol = '$1' OR elements.name = '$1';
")

# Check if element exists
if [ -z "$ELEMENT_INFO" ]; then
  echo "I could not find that element in the database."
  exit 0
fi

# Parse the element information
IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL MASS MELTING_POINT BOILING_POINT TYPE <<< "$ELEMENT_INFO"

# Output the element information
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."