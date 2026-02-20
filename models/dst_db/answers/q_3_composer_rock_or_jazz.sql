-- {{ config(materialized='view', tags=['answers']) }}
-- Donnez le nom et le compositeur des morceaux de Rock et de Jazz.
select 
    t.name as track_name,
    t.composer
from {{ref('fact_track_cd_v1')}} f
join {{ref('dim_track_v1')}} t on t.track_id = f.track_id
join {{ref('dim_genre_v1')}} g on g.genre_id = f.genre_id
where g.name in ('Rock', 'Jazz')
order by g.name, t.name