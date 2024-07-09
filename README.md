# Periodic Table Project

## Description

This project involves creating a bash script that interacts with a PostgreSQL database containing information about chemical elements. The project is divided into three main parts:

### Part 1: Fix the Database

We started with a `periodic_table` database that had some mistakes. We fixed these issues by following the user stories provided. This involved updating the existing tables, columns, and rows to ensure accurate information about the elements.

### Part 2: Create a Git Repository

We created a Git repository to version control our code. This ensures that all changes are tracked and the project can be easily shared and collaborated on.

### Part 3: Create the Script

We developed a bash script (`element.sh`) that accepts an argument in the form of an atomic number, symbol, or name of an element. The script then queries the database and outputs detailed information about the given element. The script uses the `psql` command to interact with the PostgreSQL database.

### Files

- `element.sh`: The bash script that fetches and displays element information.
- `periodic_table.sql`: A dump of the `periodic_table` database, which includes all the SQL commands to recreate the database.

### Usage

1. **Run the script**:
   ```bash
   ./element.sh <atomic_number|symbol|name>
   ```
2. **Example**:
   ```
    ./element.sh 1
    ./element.sh H
    ./element.sh Hydrogen
   ```
