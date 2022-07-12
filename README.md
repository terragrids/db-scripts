# db-scripts
DynamoDB scripts

## Get Started
Install a local instance of DynamoDB following [these instructions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html).

From the `db-scripts` repository, start the database and create a terragrids table:
```
sh ./start.sh
sh ./create-table.sh
```
Test that the table has been created:
```
sh ./scan.sh
```

## Scan and query the table
When developing on your local machine, you can always use the default parameters.

Usage (e.g. for `scan.sh`):

```sh
sh ./scan.sh "[dev|prod]" "[local|remote]"
# defaults to [prod] [local]

# e.g.
sh ./scan.sh
sh ./scan.sh dev remote
```
