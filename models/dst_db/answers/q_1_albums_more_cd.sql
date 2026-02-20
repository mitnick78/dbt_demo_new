-- {{ config(materialized='view', tags=['answers']) }}
-- Donnez les titres des albums qui ont plus de 1 CD.
select 
    al.title, 
    count(*) as nb_cds
from {{ref('fact_track_cd_v1')}} f
join {{ref('dim_album_v1')}} al on al.album_id = f.album_id
group by al.title
having count(*) > 1
order by nb_cds desc, al.title