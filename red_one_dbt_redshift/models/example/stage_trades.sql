{{ config(materialized='view') }}
select 
    trade_id, 
    account_id, 
    quantity,
    price,
    symbol
from {{ source('dev_public', 'trades_analytical') }}