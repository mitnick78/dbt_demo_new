-- {{ config(materialized='view', tags=['answers']) }}
-- Donnez le nombre de morceaux produits par chaque artiste.
select 
    ar.name as artist,
    sum(f.track_count) as nb_tracks
from {{ref('fact_track_cd_v1')}} f
join {{ref('dim_artist_v1')}} ar
    on ar.artist_id = f.artist_id
group by ar.name
order by nb_tracks desc, ar.name