-- {{ config(materialized='view', tags=['answers']) }}
-- Donnez le genre de musique le plus écouté dans les années 2000.
select 
    g.name as genre,
    sum(f.track_count) as nb_track_2000s
from {{ref('fact_track_cd_v1')}} f
join {{ref('dim_genre_v1')}} g on g.genre_id = f.genre_id
join {{ref('dim_album_v1')}} al on al.album_id = f.album_id
where al.prod_year between 2000 and 2009
group by g.name
order by nb_track_2000s desc
limit 1