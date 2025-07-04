with source as 
(
    select * from {{ source('raw_data', 'transactions') }}
)

, renamed as 
(
    select

      id                    ::int       as transaction_id
    
    --- FOREIGN KEYS
    , customer_id           ::int
    , product_id            ::int
    
    --- DATETIME FIELDS
    , transaction_date      ::date

    --- DESCRIPTIVE FIELDS
    , quantity              ::int

    from source
)

select * from renamed