#!/bin/bash
cd ~/dynamodb
java -Djava.library.path=./DynamoDBLocal_lib -jar ./DynamoDBLocal.jar -sharedDb
