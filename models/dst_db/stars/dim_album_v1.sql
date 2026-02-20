-- {{ config(materialized='table', tags=['stars_init']) }}

select distinct
    albumid as album_id,
    title,
    artistid as artist_id,
    prod_year,
    cd_year
from {{source('dst_db_source', 'ALBUM')}}