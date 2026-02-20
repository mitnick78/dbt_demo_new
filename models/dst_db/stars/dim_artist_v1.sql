-- {{ config(materialized='table', tags=['stars_init']) }}

select distinct
    artistid as artist_id,
    name,
    birthyear,
    country
from {{source('dst_db_source', 'ARTIST')}}