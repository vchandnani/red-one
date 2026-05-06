{{ config(materialized='table') }}
select distinct
    account_id,
    'Account Name ' || account_id as account_name
from {{ ref('stage_trades') }}