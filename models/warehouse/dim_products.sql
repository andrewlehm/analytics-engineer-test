with products as 
(
    select * from {{ ref('stg_products') }}
)

, final_output as 
(
    select

      product_id
    
    --- TYPE & STATUS FIELDS
    , category
    --- would consider adding in here a price category field - are these high, medium or low value products

    --- DESCRIPTIVE FIELDS
    , product
    , price_gbp

    from products
)

select * from final_output 