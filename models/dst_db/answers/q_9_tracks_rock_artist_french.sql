-- {{ config(materialized='view', tags=['answers']) }}

-- Donnez les morceaux de Rock dont les artistes sont en France.
select distinct
    t.name as track_name
from {{ref('fact_track_cd_v1')}} f
join {{ref('dim_track_v1')}} t on t.track_id = f.track_id
join {{ref('dim_genre_v1')}} g on g.genre_id = f.genre_id
join {{ref('dim_artist_v1')}} ar on ar.artist_id = f.artist_id
where g.name = 'Rock' and ar.country = 'France'
order by track_name