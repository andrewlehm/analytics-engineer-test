with source as 
(
    select * from {{ source('raw_data', 'products') }}
)

, renamed as 
(
    select

      id                        ::int       as product_id
    
    --- TYPE & STATATUS FIELDS
    , category                  ::varchar

    --- DESCRIPTIVE FIELDS
    , name                      ::varchar   as product
    , price_gbp                 ::numeric

    from source
)

select * from renamed