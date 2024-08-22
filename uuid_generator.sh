#!/bin/bash

# MySQL connection parameters
MYSQL_HOST=$host
MYSQL_USER=$user
MYSQL_PASSWORD=$Pw
MYSQL_DATABASE=$Db

# Set Variable 


if [ -z $1 ];then
    echo "Usage: $0 <table name>"
    exit 0
fi
TABLES=$1

# Create UUID Column
mysql -u$MYSQL_USER -h$MYSQL_HOST -p$MYSQL_PASSWORD $MYSQL_DATABASE -e "ALTER TABLE $TABLES ADD COLUMN uuid_id varchar(255)  NULL DEFAULT NULL"

    # Insert into UUID COLUMN
    mysql -u$MYSQL_USER -h$MYSQL_HOST -p$MYSQL_PASSWORD $MYSQL_DATABASE -e "update $TABLES SET uuid= UUID()"

### simple script
## bash uuid_table_data.sh actors

