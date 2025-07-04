with customers as
(
    select * from {{ ref('stg_customers') }}
)
, final_output as 
(
    select
      customer_id

    --- DATETIME FIELDS
    , signup_date

    --- TYPE & STATUS FIELDS
    , gender
    , country
    , case
        when age_years >= 65
        then '65+'
        when age_years >= 55
        then '55-64'
        when age_years >= 45
        then '45-54'
        when age_years >= 35
        then '35-44'
        when age_years >= 25
        then '25-34'
        when age_years >= 18
        then '18-24'
        else 'under 18s'
      end                                       ::varchar       as age_group

    --- DESCRIPTIVE FIELDS
    , concat(first_name, ' ', last_name)        ::varchar       as full_name
    , email
    , age_years

    from customers
)

select * from final_output

