-- {{ config(materialized='view', tags=['answers']) }}
-- Donnez les 10 albums les plus longs.
select 
    al.title,
    sum(f.milliseconds) as total_ms,
    round(sum(f.milliseconds) / 60000, 2) total_min
from {{ref('fact_track_cd_v1')}} f
join {{ref('dim_album_v1')}} al on al.album_id = f.album_id
group by al.title
order by total_ms desc
limit 10