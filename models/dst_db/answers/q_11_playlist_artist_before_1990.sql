-- {{ config(materialized='view', tags=['answers']) }}

-- Donnez les playlist où figurent des morceaux d'artistes nés avant 1990.
select distinct
    p.name as playlist_name
from {{source('dst_db_source', 'PLAYLIST')}} p
join {{source('dst_db_source', 'PLAYLISTTRACK')}} pt
    on pt.playlistid = p.playlistid
join {{ref('fact_track_cd_v1')}} f on f.track_id = pt.trackid
join {{ref('dim_artist_v1')}} ar on ar.artist_id = f.artist_id
where ar.birthyear < 1990
order by playlist_name