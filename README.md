# Red One

Technology Playground: AWS S3, AWS Redshift, and DBT.

## High-Level Design

1. Install prerequisites.
2. Configure AWS.
3. Clone the repository.
4. Spin up Redshift Serverless.
5. Copy processed Parquet from S3 into Redshift tables.
6. Configure DBT for Redshift with simple models.
7. Read Redshift tables, build star schema, and add tests.

## Prerequisites

Required:
- `Python` (validated with Python `3.14.0`)

Recommended:
- `git` latest stable

## AWS Configuration

1. Root User
https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html
2. IAM User
https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html
3. Access Keys
https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html
4. Redshift Serverless
https://docs.aws.amazon.com/redshift/latest/gsg/new-user-serverless.html
5. DBT
https://docs.getdbt.com/guides/redshift

## Clone Repository

```bash
git clone https://github.com/vchandnani/red-one.git
cd red-one
python3 -m venv .venv
source .venv/bin/activate
```

## Project Structure (5 Levels)
```text
.
├── logs
│   └── dbt.log
├── README.md
└── red_one_dbt_redshift
    ├── analyses
    ├── dbt_project.yml
    ├── logs
    │   └── dbt.log
    ├── macros
    ├── models
    │   └── example
    │       ├── dimension_account.sql
    │       ├── fact_account_positions.sql
    │       ├── my_first_dbt_model.sql
    │       ├── my_second_dbt_model.sql
    │       ├── schema.yml
    │       ├── sources.yml
    │       └── stage_trades.sql
    ├── seeds
    ├── snapshots
    ├── target
    │   ├── compiled
    │   │   └── red_one_dbt_redshift
    │   │       └── models
    │   ├── graph_summary.json
    │   ├── graph.gpickle
    │   ├── manifest.json
    │   ├── partial_parse.msgpack
    │   ├── run
    │   │   └── red_one_dbt_redshift
    │   │       └── models
    │   ├── run_results.json
    │   └── semantic_manifest.json
    └── tests
```

## Data Build Tool (DBT)

```bash
$ dbt init
Enter requested information
$ dbt debug
This command tests the DBT-Redshift connection
$ dbt run
Executes models only
$ dbt build
Executes models, tests, seeds, and snapshots all at once in the correct dependency order.
```

## Debug Hard

DBT Initialization Errors

```bash
mashumaro.exceptions.UnserializableField: Field "schema" of type Optional[str] in JSONObjectSchema is not serializable
```
Solution
```bash
python3 -m pip install "mashumaro[msgpack]>=3.17"
```