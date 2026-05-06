{{ config(materialized='table') }}
select
    account_id,
    sum(quantity) as account_volume,
    sum(quantity * price) as account_notional
from {{ ref('stage_trades') }}
group by 1