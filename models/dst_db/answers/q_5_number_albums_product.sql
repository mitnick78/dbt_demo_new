-- {{ config(materialized='view', tags=['answers']) }}
-- Donnez le nombre d'albums produits pour chaque artiste.
select 
    ar.name as artist,
    count(*) as nb_albums
from {{ref('dim_album_v1')}} al
join {{ref('dim_artist_v1')}}  ar
    on ar.artist_id = al.artist_id
group by ar.name
order by nb_albums desc, ar.name