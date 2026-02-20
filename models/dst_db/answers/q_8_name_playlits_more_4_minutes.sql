-- {{ config(materialized='view', tags=['answers']) }}

-- Donnez les noms de toutes les playlists où figurent des morceaux de plus de 4 minutes.
select distinct
    p.name as playlist_name
from {{source('dst_db_source', 'PLAYLIST')}} p
join {{source('dst_db_source', 'PLAYLISTTRACK')}} pt on pt.playlistid = p.playlistid
join {{ref('fact_track_cd_v1')}} f on f.track_id = pt.trackid
where f.milliseconds > 4 * 60 * 1000
order by playlist_name