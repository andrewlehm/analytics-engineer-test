with source as 
(
    select * from {{ source('raw_data', 'customers') }}
)

, renamed as 
(
    select

      id                            ::int       as customer_id
    
    --- DATETIME FIELDS
    , signup_date                   ::date

    --- TYPE & STATUS FIELDS
    , gender                        ::varchar
    , country                       ::varchar

    --- DESCRIPTIVE FIELDS
    , first_name                    ::varchar
    , last_name                     ::varchar
    , email                         ::varchar
    , age                           ::int       as age_years

    from source
)

select * from renamed
