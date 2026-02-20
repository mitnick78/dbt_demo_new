-- {{ config(materialized='table', tags=['stars_init']) }}

select distinct
    genreid as genre_id,
    name
from {{source('dst_db_source', 'GENRE')}}