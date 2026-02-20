-- {{ config(materialized='table', tags=['stars_init']) }}

select distinct
    t.trackid as track_id,
    t.albumid as album_id,
    al.artistid as artist_id,
    t.mediatypeid as mediatype_id,
    t.genreid as genre_id,
    t.milliseconds,
    t.bytes,
    t.unitprice,
    1 as track_count
from {{source('dst_db_source', 'TRACK')}} t
join {{source('dst_db_source', 'ALBUM')}} al on al.albumid = t.albumid
where al.cd_year is not null
