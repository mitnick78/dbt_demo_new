-- {{ config(materialized='view', tags=['answers']) }}
--  Donnez la moyenne des tailles des morceaux par genre musical.
select 
    g.name as genre,
    avg(f.bytes) as avg_bytes
from {{ref('fact_track_cd_v1')}} f
join {{ref('dim_genre_v1')}} g on g.genre_id = f.genre_id
group by g.name
order by avg_bytes desc