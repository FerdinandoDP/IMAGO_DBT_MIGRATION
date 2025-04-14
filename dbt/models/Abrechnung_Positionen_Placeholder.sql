select *
from {{ ref('Staging_Abrechnung_Positionen') }}
where Bildnummer = 100000000
and ReId is not NULL 
and KdNr is not null
and KdNr in (
    select distinct KdNr
    from {{ ref('Staging_Abrechnung_Kunden') }}
)