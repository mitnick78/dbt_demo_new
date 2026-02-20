-- {{ config(materialized='view', tags=['answers']) }}
-- Donnez les morceaux produits en 2000 ou en 2002.
select 
    t.name as track_name
from {{ref('fact_track_cd_v1')}} f
join {{ref('dim_album_v1')}} al on al.album_id = f.album_id
join {{ref('dim_track_v1')}} t on t.track_id = f.track_id
where al.prod_year in (2000, 2002)
order by t.name
