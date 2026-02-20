-- {{ config(materialized='table', tags=['stars_init']) }}

select distinct
    mediatypeid as mediatype_id,
    name
from {{source('dst_db_source', 'MEDIATYPE')}}