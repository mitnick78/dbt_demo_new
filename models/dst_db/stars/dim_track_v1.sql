-- {{ config(materialized='table', tags=['stars_init']) }}

select distinct
    trackid as track_id,
    name,
    composer
from {{source('dst_db_source', 'TRACK')}}