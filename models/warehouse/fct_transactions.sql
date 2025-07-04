with transactions as 
(
    select * from {{ ref('stg_transactions') }}
)

, products as 
(
    select * from {{ ref('stg_products') }}
)

, combined as 
(
    select 
      t.transaction_id
    
    --- FOREIGN KEYS
    --- create field that groups together all transactions by the same customer in the same day. Assume these were all made in a single purchase
    --- would use dbt_utils - generate surrogate key if I had the package installed
    , concat(t.transaction_id::varchar, t.customer_id::varchar, t.transaction_date::varchar)        ::varchar       as transaction_group_id
    , t.customer_id
    , t.product_id

    --- DATETIME FIELDS
    , t.transaction_date

    --- DESCRIPTIVE FIELDS
    , t.quantity
    , t.quantity * p.price_gbp                                                                      ::numeric       as revenue_gbp

    from transactions t

    left outer join products p
    on t.product_id = p.product_id
)

select * from combined
